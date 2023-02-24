class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    #@delivery_address = current_customer.address
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
    elsif params[:order][:delivery_address_number] == "2"
       @order.post_code
       @order.address 
       @order.name
    else
      render 'new'
    end
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
     if @order.save
      cart_items.each do |cart|
       order_detail = OrderDetail.new
       order_detail.order_id = @order.id
       order_detail.item_id = cart.item_id
       order_detail.amount = cart.amount
       order_detail.price = cart.item.price
       order_detail.save
      end
     end
    redirect_to orders_complete_path
    cart_items.destroy_all
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
   @order = Order.find(params[:id])
   @order_items = @order.order_details
  end

   private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :total_payment, :status, :postage)
  end

end
