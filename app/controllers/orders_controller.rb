class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  

  def index
    @order_street_address = OrderStreetAddress.new
    if @item.order != nil ||  @item.user == current_user 
      redirect_to root_path
    end

  end

 
  def create
    @order_street_address = OrderStreetAddress.new(order_street_address_params)
     if @order_street_address.valid?
      pay_item
      @order_street_address.save
       redirect_to root_path
     else
       render action: :index
     end
    end

 private

 def order_street_address_params
  params.require(:order_street_address).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
 end
 
def set_item
  @item = Item.find(params[:item_id])
end


 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item[:price],  # 商品の値段
    card: order_street_address_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

end

