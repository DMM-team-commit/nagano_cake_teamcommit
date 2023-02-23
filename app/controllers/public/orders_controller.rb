class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    #@delivery_address = current_customer.delivery_address
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.postage = 800
    if params[:order][:delivery_address_number] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name= "#{ current_customer.first_name + current_customer.last_name }"
    elsif params[:order][:delivery_address_number] == "1"
      @delivery_address = DeliveryAddress.find(params[:order][:address_id])
      @order.post_code = @delivery_address.post_code
      @order.address = @delivery_address.address
      @order.name = @delivery_address.addressee

    else
      render 'new'
    end
  end

  def complete
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @ordered_item = OrderedItem.new
      @ordered_item.order_id = @order.id
      @ordered_item.item_id = cart_item.item_id
      @ordered_item.count = cart_item.count
      @ordered_item.price_tax_included = cart_item.item.price_without_tax*1.1
      @ordered_item.save
    end
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
   @order = Order.find(params[:id])
   @order_items = @order.order_items
  end

   private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :total_payment, :status)
  end

end
