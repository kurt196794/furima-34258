require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
      @item = FactoryBot.build(:item)
  end



  describe '商品出品機能' do

    context '新規登録できるとき' do
      it '全ての値が正常であれば登録できる'do
      expect(@item).to be_valid
    end
  end

    context '新規登録できないとき' do
       it '画像が空では登録できないこと' do 
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
       end


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

      it'販売価格は、¥300以上が保存可能であること'do
      @item.price= 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it'販売価格は、¥10000000以上だと保存できないこと'do
      @item.price= 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it'販売価格は半角数字のみ保存可能であること'do
      @item.price= 'aa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it'カテゴリーの情報は一行目以外を入力すること'do
      @item.category_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      
      it'商品の状態についての情報は一行目以外を入力すること'do
      @item.condition_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it'配送料の負担についての情報は一行目以外を入力すること'do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end

    it'発送元の地域についての情報は一行目以外を入力すること'do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
    end

    it'発送までの日数についての情報は一行目以外を入力すること'do
      @item.delivery_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
    end
  end 

  end  
end
