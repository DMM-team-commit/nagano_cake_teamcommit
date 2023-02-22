class Public::CartItemsController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    render 'index'
  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
    else
      @cart_item.save
    end
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
    @order = Order.new
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(item_params)
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount, :price)
  end

end
