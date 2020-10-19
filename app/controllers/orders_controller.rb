class OrdersController < ApplicationController

  def index
    @order_street_address = OrderStreetAddress.new
    @item = Item.find(params[:item_id])
  end

 
  def create
    @order_street_address = UserDonation.new(order_street_address_params)   #「UserDonation」に編集
     if @order_street_address.valid?
      @order_street_address.save
       redirect_to action: :index
     else
       render action: :new
     end
    end

 private

 def order_street_address_params
  params.require(:order_street_address).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number, :order).merge(user_id: current_user.id, item_id: params[:item_id])
 end
 
end

