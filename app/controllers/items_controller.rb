class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
 # before_action :contributor_confirmation, only: [:edit, :update]
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def update
        @item = Item.find(params[:id])
    if  @item.update(item_params)
        redirect_to  item_path(@item)
   else
      render :edit
   end
 end

  def  new
    @item = Item.new
   end
  
   def edit
     @item = Item.find(params[:id])
     redirect_to root_path unless current_user.id == @item.user_id
   end

  def create
    @item = Item.new(item_params)
    @item.user = current_user 
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private


  def item_params
    params.require(:item).permit(:category_id,:description,:condition_id,:shipping_id,:delivery_area_id,:delivery_date_id,:price,:name,:image)
  end

end

