class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  def index
    @item = Item.all
  end  

  def new
    @item = Item.new
  end  

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to item_path(@item)
    else  
      render :new
    end   
  end

  def show
  end 

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
     if item.save
       redirect_to item_path
    else  
      render :edit
    end   
  end  

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end  

  private
  def item_params
    params.require(:item).permit(:code, :name, :price, :color, :size, :city, :stock_num, :memo)
  end

  def set_item
    @item = Item.find(params[:id])
  end  
end
