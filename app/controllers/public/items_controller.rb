class Public::ItemsController < ApplicationController

  def index
    @item = Item.new(item_params)
    @item = Item.where(is_active: true)
    @items = @item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end


end
