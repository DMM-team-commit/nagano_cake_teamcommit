class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    #@delivery_address = current_customer.delivery_address
  end
  
  def comfirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    if params [:order][:delivery_address_number] == "0"
      @order.post_code = current_customer.post_code
      @order.delivery_address = current_customer.delivery_address
      @order.addressee = "#{ current_customer.first_name + current_customer.last_name }"
    elsif params [:order][:delivery_address_number] == "1"
      @delivery_address = DeliveryAddress.find(params[:order][:delivery_address_id])
      @order.post_code = @delivery_address.post_code
      @order.delivery_address = @delivery_address.delivery_address
      @order.addressee = @delivery_addressee
    else
      render 'new'
    end
  end
  
  def complete
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    cart = current_customer.carts.all
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
    params.require(:order).permit(:payment_method, :post_code, :delivery_address, :addressee, :total_payment, :status)
  end
  
end
