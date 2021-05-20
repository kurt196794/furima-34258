require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
      @item = FactoryBot.build(:item)
  end


  describe '商品出品機能' do
       #it '商品画像を1枚つけることが必須であること' do 
       #end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること'do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it'カテゴリーの情報が必須であること'do
        @item.category_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it'商品の状態についての情報が必須であること'do
        @item.condition_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end

      it'配送料の負担についての情報が必須であること'do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping is not a number")
      end

      it'発送元の地域についての情報が必須であること'do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area is not a number")
      end

      it'発送までの日数についての情報が必須であること'do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date is not a number")
      end
      it'販売価格についての情報が必須であること'do
        @item.price= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it'販売価格は、¥300~¥9,999,999の間のみ保存可能であること'do
      @item.price= '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it'販売価格は半角数字のみ保存可能であること'do
      @item.price= 'aa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      # it'入力された販売価格によって、販売手数料や販売利益の表示が変わること'do

      # end

      # it'必要な情報を適切に入力すると、商品情報がデータベースに保存されること'do
      # end

      # it'エラーハンドリングができていること（入力に問題がある状態で「出品する」ボタンが押された場合、情報は保存されず、出品ページに戻りエラーメッセージが表示されること'do
      # end

      # it'エラーハンドリングの際、1つのエラーに対して同じエラーメッセージが重複して表示されないこと'do
      # end
      

  end  
end
