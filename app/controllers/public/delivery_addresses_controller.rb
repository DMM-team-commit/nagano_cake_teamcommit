class Public::DeliveryAddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @delivery_address = DeliveryAddress.new
    @delivery_address.customer_id = current_customer.id
    
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end
  
  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.customer_id = current_customer.id
    if  @delivery_address.save
     redirect_to customers_delivery_address_path
    else
     @delivery_address = DeliveryAddress.new
     @delivery_address.customer_id = current_customer.id
     render 'index'
    end
  end
  
  def update
    delivery_address = DeliveryAddress.find(params[:id])
    delivery_address.update(delivery_address_params)
    redirect_to customers_delivery_address_path
  end

  def destroy
    delivery_address = DeliveryAddress.find(params[:id])
    delivery_address.destroy
    redirect_to customers_delivery_address_path
  end
  
    private

  def delivery_address_params
    params.require(:delivery_address).permit(:customer_id, :post_code, :address, :addressee)
  end
  
end
