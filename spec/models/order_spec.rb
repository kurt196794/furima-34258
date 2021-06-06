require 'rails_helper'

RSpec.describe Order, type: :model do
    before do 
      item = FactoryBot.create(:item)      
      user = FactoryBot.create(:user)      
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep(0.1)
    end
  
    
   describe '商品購入機能' do

    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@order).to be_valid
      end
      it "建物名はなくても保存できる" do
       @order.building_name = ''
       expect(@order).to be_valid
      end
    end

     context '内容に問題がある場合' do

            it "郵便番号の保存にはハイフンが必要であること（123-4567となる）"do
            @order.postal_code = "123456"
            @order.valid?
            expect(@order.errors.full_messages).to include("Postal code is invalid")
            end

            it "電話番号は11桁以内の数値のみ保存可能なこと（09012345678となる）"do
            @order.phone_number = "123456123456"
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone number is invalid")

            end
            it "郵便番号が空ではいけないこと"do
            @order.postal_code = ""
            @order.valid?
            expect(@order.errors.full_messages).to include("Postal code can't be blank")
            end

            it "発送元の地域についての情報は一行目以外を入力すること" do
            @order.delivery_area_id = 1
            @order.valid?
            expect(@order.errors.full_messages).to include("Delivery area must be other than 1")
            end

            it  "市区町村が空ではいけないこと" do
            @order.municipalities= ''
            @order.valid?
            expect(@order.errors.full_messages).to include("Municipalities can't be blank")
            end

            it "番地が空ではいけないこと" do
            @order.address= ""
            @order.valid?
            expect(@order.errors.full_messages).to include("Address can't be blank")
            end

            it "電話番号が空ではいけないこと" do
            @order.phone_number= ''
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone number can't be blank")
            end


            it "phone_numberが英数混合では登録できないこと" do
              @order.phone_number= "aa123456789"
              @order.valid?
              expect(@order.errors.full_messages).to include("Phone number is invalid")
              end

            it "tokenが空では登録できないこと" do
              @order.token = nil
              @order.valid?
              expect(@order.errors.full_messages).to include("Token can't be blank")
            end

            it "user_idが空だと登録できない" do
            @order.user_id= ""
            @order.valid?
            expect(@order.errors.full_messages).to include("User can't be blank")
            end

            it " item_idが空だと登録できない" do
            @order.item_id= ""
            @order.valid?
            expect(@order.errors.full_messages).to include("Item can't be blank")
            end

      end
  end
end

