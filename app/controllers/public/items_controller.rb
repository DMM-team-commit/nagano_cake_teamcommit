class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @item = Item.new
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
