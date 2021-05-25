class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @items = Item.all.order("created_at DESC")
  end

# def move_to_index
#   redirect_to action: :index unless user_signed_in?
# end

  def  new
    @item = Item.new
   end
  
   #def edit
    # @item = Item.find(params[:id])
   #end

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

