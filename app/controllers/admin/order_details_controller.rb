class Admin::OrderDetailsController < ApplicationController
  
before_action :authenticate_admin!
  
  def update
  @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    
    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.making_status == "manufacturing"
      
end
