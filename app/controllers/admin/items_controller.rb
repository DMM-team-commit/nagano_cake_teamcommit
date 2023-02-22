class Admin::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    #binding.pry
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :genre_id, :price, :is_active)
  end
end
