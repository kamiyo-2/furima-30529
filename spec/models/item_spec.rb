require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能がうまくいくとき' do

    it "name, description, category_id, status_id, burde_id, area_id, day_id, price,imageが存在すれば登録できる" do
      expect(@item).to be_valid
    end
  end

  context '商品出品機能がうまくいかないとき' do
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "descripyionが空だと登録できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
    it "status_idが空だと登録できない" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
    end
    it "burde_idが空だと登録できない" do
      @item.burde_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Burde can't be blank", "Burde is not a number")
    end
    it "area_idが空だと登録できない" do
      @item.area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
    end
    it "day_idが空だと登録できない" do
      @item.day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank", "Day is not a number")
    end
    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが¥300未満だと登録できない" do
      @item.price = "30"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end
    it "priceが¥9,999,999以上だと登録できない" do
      @item.price = "999999999999"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
    it "priceが半角数字出ないと登録できない" do
      @item.price = "aaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
