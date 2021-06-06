class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, except: [:index, :new, :create,]
  before_action :set_item_sold_blank?, only:[:edit,:update,:destroy]
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def update
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
   end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
   @item.destroy
   redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:category_id,:description,:condition_id,:shipping_id,:delivery_area_id,:delivery_date_id,:price,:name,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_sold_blank?
    redirect_to root_path unless current_user.id == @item.user_id && @item.sold.blank?
  end

end

