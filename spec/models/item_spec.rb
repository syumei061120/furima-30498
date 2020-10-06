require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    # 商品出品機能
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空だと保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'categoryが空だと保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'categoryが0だと保存できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
    it 'statusが空だと保存できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'statusが0だと保存できないこと' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end
    it 'postage_userが空だと保存できないこと' do
      @item.postage_user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage user can't be blank")
    end
    it 'postage_userが0だと保存できないこと' do
      @item.postage_user_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage user Select")
    end
    it 'stateが空だと保存できないこと' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it 'stateが0だと保存できないこと' do
      @item.state_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("State Select")
    end
    it 'shipping_date_idが空だと保存できないこと' do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
    it 'shipping_date_idが0だと保存できないこと' do
      @item.shipping_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date Select")
    end
    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300以下だと保存できないこと' do
      @item.price = '250'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it 'priceが9,999,999以上だと保存できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it 'priceが半角英語だと保存できないこと' do
      @item.price = 'test'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it 'priceが全角日本語だと保存できないこと' do
      @item.price = 'テスト試験'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
