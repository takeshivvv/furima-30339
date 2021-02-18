require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe "商品出品機能" do
  context "商品出品がうまく出来た時" do
  it "imageとnameとinfoとcategory_idとstatus_idとshipping_fee_idとshipping_area_idとday_to_ship_idとpriceがあれば商品出品できる" do
  expect(@item).to be_valid
      end
end



 context "商品出品がうまく行かない時" do
  
  
  
  it "nameが空だと登録出来ない" do  
    @item.name = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
   
  it "infoが空だと登録出来ない" do
    @item.info = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Info can't be blank")
  end

  it "category_idが空だと登録出来ない" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end

  it "status_idが空だと登録出来ない" do
    @item.status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Status must be other than 1")
  end

  it "shipping_fee_idが空だと登録できない" do
    @item.shipping_fee_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
  end

  it "shipping_area_idが空だと登録できない" do
    @item.shipping_area_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
  end

  it "day_to_ship_idが空だと登録できない" do
    @item.day_to_ship_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Day to ship must be other than 1")
  end

  it "priceが空だと登録できない" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end

  it "priceは300円以下では出品できない" do
    @item.price = 111
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

  it "priceは10000000円以上では出品できない" do
    @item.price = 100000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
  end

  it "priceは半角数字でないと登録できない" do
    @item.price = "１１"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end

  it "priceは半角英数字混合では出品できない" do
  @item.price = "11eee"
  @item.valid?
  expect(@item.errors.full_messages).to include("Price is not a number")
end

  it "priceは半角英字のみでは出品できない" do
  @item.price = "wwwwww"
  @item.valid?
  expect(@item.errors.full_messages).to include("Price is not a number")
end

  it "imageが空の時は登録できない" do
  @item.image = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Image can't be blank")
  end
end
end
end