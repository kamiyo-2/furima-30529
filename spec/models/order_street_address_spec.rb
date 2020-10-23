require 'rails_helper'
describe OrderStreetAddress do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item = FactoryBot.build(:item,user_id: seller.id)
    item.save
    @order_street_address = FactoryBot.build(:order_street_address, item_id: item.id, user_id: buyer.id)
    sleep(1)
  end

  describe '購入機能' do
    context '新規登録がうまくいくとき' do
      it "post_code, area_id, city, address, phone_numberが存在すれば登録できる" do
        expect(@order_street_address).to be_valid
      end
    end

    context '購入機能の登録がうまくいかないとき' do
      it "post_codeが空だと登録できない" do
        @order_street_address.post_code = nil
        @order_street_address.valid?
        expect(@order_street_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it "area_idが空では登録できない" do
        @order_street_address.area_id = nil
        @order_street_address.valid?
        expect(@order_street_address.errors.full_messages).to include("Area can't be blank")
      end
      it "cityが空では登録できない" do
        @order_street_address.area_id = nil
        @order_street_address.valid?
        expect(@order_street_address.errors.full_messages).to include("Area can't be blank")
      end
      it "addressが空では登録できない" do
        @order_street_address.address = nil
        @order_street_address.valid?
        expect(@order_street_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @order_street_address.phone_number = nil
        @order_street_address.valid?
        expect(@order_street_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is too short (minimum is 11 characters)")
      end
      it "phone_numberが11文字でないと登録できない" do
        @order_street_address.phone_number = "090"
        @order_street_address.valid?
        expect(@order_street_address.errors.full_messages).to include("Phone number is too short (minimum is 11 characters)")
      end
      it "post_codeにハイフンがないと登録できない" do
        @order_street_address.post_code = "1234567"
        @order_street_address.valid?
        expect(@order_street_address.errors.full_messages).to include( "Post code is invalid. Include hyphen(-)")
      end
      it "tokenが空では登録できない" do
        @order_street_address.token = nil
        @order_street_address.valid?
        expect(@order_street_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
