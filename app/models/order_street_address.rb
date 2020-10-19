class OrderStreetAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :order, :user, :item

 

  with_options presence: true do    
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id           
    validates :city       
    validates :address
    validates :phone_number, length: { minimum: 11 }
    validates :order
    validates :user
    validates :item
  end

    def save
      oder = Oder.create(user: user, item: item)
      Street_address.create(post_code: post_code, area_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order: order.id)
    end

end
