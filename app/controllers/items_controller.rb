class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.includes(:user).order("created_at ASC")
  end
  
  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

    #def destroy
     #if @item.destroy
      #redirect_to root_path
    #else
      #redirect_to root_path
    #end
    
  #end
end
  private

  def item_params
    params.require(:item).permit(:image,:name, :info, :category_id, :status_id, :shipping_fee_id, :shipping_area_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  end
