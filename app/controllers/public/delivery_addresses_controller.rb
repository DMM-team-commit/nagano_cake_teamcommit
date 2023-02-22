class Public::DeliveryAddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @delivery_address = DeliveryAddress.new
    @delivery_addresses = current_customer.delivery_addresses
    
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end
  
  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.customer_id = current_customer.id
    @post_code = params[:delivery_address][:first_post_code].to_s + params[:delivery_address][:second_post_code].to_s
    @delivery_address.post_code = @post_code.to_i
    if  @delivery_address.save
     redirect_to delivery_addresses_path
     flash[:success] = "登録しました。"
    else
     render 'index'
    end
  end
  
  def update
    delivery_address = DeliveryAddress.find(params[:id])
    delivery_address.update(delivery_address_params)
    redirect_to delivery_addresses_path
  end

  def destroy
    delivery_address = DeliveryAddress.find(params[:id])
    delivery_address.destroy
    redirect_to delivery_addresses_path
  end
  
    private

  def delivery_address_params
    params.require(:delivery_address).permit(:customer_id, :post_code, :address, :addressee)
  end
  
end
