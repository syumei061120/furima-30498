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

    it 'imagesが空だと保存できないこと' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("出品画像を入力してください")
    end
    it 'nameが空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it 'categoryが空だと保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it 'categoryが0だと保存できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end
    it 'statusが空だと保存できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end
    it 'statusが0だと保存できないこと' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を選択してください")
    end
    it 'postage_userが空だと保存できないこと' do
      @item.postage_user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it 'postage_userが0だと保存できないこと' do
      @item.postage_user_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
    end
    it 'stateが空だと保存できないこと' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end
    it 'stateが0だと保存できないこと' do
      @item.state_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
    end
    it 'shipping_date_idが空だと保存できないこと' do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end
    it 'shipping_date_idが0だと保存できないこと' do
      @item.shipping_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end
    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end
    it 'priceが300以下だと保存できないこと' do
      @item.price = '250'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は ¥300〜9,999,999 で設定してください")
    end
    it 'priceが9,999,999以上だと保存できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は ¥300〜9,999,999 で設定してください")
    end
    it 'priceが半角英語だと保存できないこと' do
      @item.price = 'test'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は ¥300〜9,999,999 で設定してください")
    end
    it 'priceが全角日本語だと保存できないこと' do
      @item.price = 'テスト試験'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は ¥300〜9,999,999 で設定してください")
    end
  end
end

