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
    #redirect_to admin_items_path
    render 'index'
  end

  def show
    @item = Item.find(params[:id])
    #@tax_included_price = 0
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
      #render edit_admin_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :item_image, :name, :detail, :genre_id, :tax_exclusive_price, :is_active,)
  end
end
