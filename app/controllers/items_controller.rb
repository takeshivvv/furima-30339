class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destory ]


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
  end

    def update
      
      if @item.update(item_params)
         redirect_to root_path
      else  
        render :edit
      end
         
    end
    
    def edit
      
    end
    
    def destroy
     if @item.destroy
      redirect_to root_path
    else 
      render :show
    end
    end

    def show
    
    end
  #end
  private

  def item_params
    params.require(:item).permit(:image,:name, :info, :category_id, :status_id, :shipping_fee_id, :shipping_area_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
  @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.id == @item.user_id == @item.buyer.blank?
  end

end
