class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @order_street_address = OrderStreetAddress.new
    @item = Item.find(params[:item_id])
    if @item.user == current_user
      redirect_to root_path
    end
  end

 
  def create
    @order_street_address = OrderStreetAddress.new(order_street_address_params)
    @item = Item.find(params[:item_id])
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
 

 def pay_item
  Payjp.api_key = "sk_test_eb084e04dd380a69735e2afe"   # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item[:price],  # 商品の値段
    card: order_street_address_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

end

