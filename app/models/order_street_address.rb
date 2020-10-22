class OrderStreetAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

 

  with_options presence: true do    
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id           
    validates :city       
    validates :address
    validates :phone_number, length: { minimum: 11 }
    validates :user_id
    validates :item_id
    validates :token, presence: true
  end

    def save
     
      order = Order.create(user_id: user_id, item_id: item_id)
      StreetAddress.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id )
    end

end
