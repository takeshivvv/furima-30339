require 'rails_helper'

 RSpec.describe User, type: :model do 
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録がうまくいく時' do
      it "nicknameとemailとpasswordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kana、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      
    end
    
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      
      it "passwordが5文字以下では登録できない" do
      @user.password = "11ooo"
      @user.password_confirmation = "11ooo"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    
      
      it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      
      it "first_name_kanaがカタカナでないと登録できない" do
      @user.first_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      
      it "last_name_kanaがカタカナでないと登録できない" do
        @user.last_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end


        it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it "passwordがからの時登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが英語のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input number and alphabet characters.")
      end
      it "passwordが数字のみでは登録でいない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input number and alphabet characters.")
      end
      it "passwordが全角では登録できない" do
        @user.password = "ああああああ"
        @user.password_confirmation = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")

      end
      it "emailに＠がないと登録できない" do
        @user.email = "111a111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "first_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.first_name = "******"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "last_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.last_name = "******"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end


    end
  end
end
  
  
  
  
  #pending "add some examples to (or delete) #{__FILE__}"


