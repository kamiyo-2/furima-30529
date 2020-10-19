class OrdersController < ApplicationController
  def index
    @order_street_address = Order_Street_address.find(params[:id])
  end

 private

 def order_street_address_params
  params.require(:order_street_address).permit(:post_code, :prefectures_id, :city, :address, :building_name, :phone_number, :order, :user, :item)
 end
end

