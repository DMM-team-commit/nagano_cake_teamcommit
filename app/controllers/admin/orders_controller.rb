class Admin::OrdersController < ApplicationController

  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end

  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
    @orders = @customer.orders.order(created_at: :desc).page(params[:page]).per(10)
  end

  def  update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "confirmation"
    end
     redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
