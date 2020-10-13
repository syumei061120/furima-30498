require 'rails_helper'

RSpec.describe PurchaceAddress, type: :model do
  describe '#create' do
    before do
      @purchace_address = FactoryBot.build(:purchace_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchace_address).to be_valid
    end
    it 'buildingが空でも保存できること' do
      @purchace_address.building = nil
      expect(@purchace_address).to be_valid
    end

    it 'カード情報が正しくなく、tokenが空では登録できないこと' do
      @purchace_address.token = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    it 'postal_codeが空では登録できないこと' do
      @purchace_address.postal_code = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'postal_codeにハイフンが含まれていないと登録できないこと' do
      @purchace_address.postal_code = 1_234_567
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("郵便番号を正しい形式で入力して下さい")
    end
    it 'postal_codeの文字数が正しくないと登録できないこと' do
      @purchace_address.postal_code = 1234 - 567
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("郵便番号を正しい形式で入力して下さい")
    end
    it 'state_idが空では登録できないこと' do
      @purchace_address.state_id = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("都道府県を入力してください")
    end

    it 'state_idが0では登録できないこと' do
      @purchace_address.state_id = '0'
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("都道府県を選択してください")
    end

    it 'cityが空では登録できないこと' do
      @purchace_address.city = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("市区町村を入力してください")
    end

    it 'address_lineが空では登録できないこと' do
      @purchace_address.address_line = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("番地を入力してください")
    end

    it 'telephoneが空では登録できないこと' do
      @purchace_address.telephone = nil
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'telephoneが11桁以上では登録できないこと' do
      @purchace_address.telephone = '123456789012'
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("電話番号は数字のみ入力してください")
    end
    it 'telephoneにハイフンが含まれると登録できないこと' do
      @purchace_address.telephone = '12-3456-7890'
      @purchace_address.valid?
      expect(@purchace_address.errors.full_messages).to include("電話番号は数字のみ入力してください")
    end
  end
end
