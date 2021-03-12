class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :buyer_item, only: [:create, :index]
  before_action :contributor_confirmation, only: [:create, :index ]
  def index

    @buyer = BuyerForm.new
    
  end

  def create
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

  def buyer_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: set_params[:token],   
      currency: 'jpy'                 
    )
  end

  def contributor_confirmation
    if current_user.id == @item.user.id || @item.buyer.present?
      redirect_to root_path
    end
  end

end