require 'rails_helper'

RSpec.describe BuyerForm, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @buyer_form = FactoryBot.build(:buyer_form, user_id: @user.id, item_id: @item.id)
    sleep(0.5)
  end

describe "商品購入機能" do
  context "商品購入がうまく出来た時" do
  it "postal_codeとshipping_area_idとcityとaddressesとphone_numberがあれば購入できる" do
  expect(@buyer_form).to be_valid
      end
end



 context "商品購入がうまく行かない時" do
  
  it "postal_codeがないと購入できない" do
    @buyer_form.postal_code = ""
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("Postal code can't be blank")
  end

  it "shipping_area_idが空だとと購入できない" do
    @buyer_form.shipping_area_id = ""
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("Shipping area can't be blank")
  end

  it "cityが空だと購入できない" do
    @buyer_form.city = ""
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("City can't be blank")
  end

  it "addressesが空だと登録できない" do
    @buyer_form.addresses = ""
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("Addresses can't be blank")
  end

  it "phone_numberが空だと登録できない" do
    @buyer_form.phone_number = ""
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("Phone number can't be blank")
  end

  it "postal_codeはハイフンなしでは登録できない" do
    @buyer_form.postal_code = 1234567
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("Postal code ハイフンが必要である")
  end

  it "shipping_area_idは空では登録できない" do
    @buyer_form.shipping_area_id = 1
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("Shipping area must be other than 1")

    
  end

  it "phone_numberは英数字では登録できない" do
    @buyer_form.phone_number = "1e2fde3f"
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("Phone number 数字のみ登録可")
  end

  it "phone_numberは12桁以上では登録できない" do
    @buyer_form.phone_number = "12312312312312312"
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
  end

  it "user_idが空の場合購入できない" do
    @buyer_form.user_id = ""
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("User can't be blank")
  end


  it "item_idが空の場合購入できない" do
    @buyer_form.item_id = ""
    @buyer_form.valid?
    expect(@buyer_form.errors.full_messages).to include("Item can't be blank")
  end
end

end
end
  