class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
   # @delivery_addresses = current_customer.delivery_addresses
  end
  
  def comfirm
    
  end
  
  def complete
  end
  
  def create
  end

  def index
  end
  
  def show
  end
  
end
