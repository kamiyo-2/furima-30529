FactoryBot.define do
  factory :order_street_address do
    post_code             {"123-4567"}
    area_id               {"3"}
    city                  {"宇都宮"}
    address               {"栃木県"}
    phone_number          {"09012345678"}
    token    { 'sampletokensampletoken' }
    association :user  
    association :item
    
  end
end