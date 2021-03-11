class BuyersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    # ログインしているユーザーと出品者
    if current_user.id == @item.user.id || @item.buyer.present?
      redirect_to root_path
    end
    @buyer = BuyerForm.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer = BuyerForm.new(set_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_params
    params.require(:buyer_form).permit(:postal_code, :shipping_area_id, :city, :addresses, :building, :phone_number, :buyer_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょ
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: set_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
























