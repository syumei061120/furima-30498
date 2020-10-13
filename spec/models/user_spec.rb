require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    # 'ユーザー管理機能／新規登録（ユーザー情報）'
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'emailに＠が含まれていないと保存できないこと' do
      @user.email = 'testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it 'emailが重複していると保存できないこと' do
      @user.save
      user2 = FactoryBot.build(:user, email: @user.email)
      user2.valid?
      expect(user2.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it 'passwordが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordが5文字以下では保存できないこと' do
      @user.password = '123ab'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it 'passwordが半角英語のみだと保存できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて設定してください")
    end
    it 'passwordが半角数字のみだと保存できないこと' do
      @user.password = '123456'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて設定してください")
    end
    it 'passwordと確認用パスワードが一致しないと保存できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    #  'ユーザー管理機能／新規登録（本人情報確認）'
    it 'ユーザー本名の姓が空だと保存できないこと' do
      @user.family_name = nil
      @user.valid?

      expect(@user.errors.full_messages).to include("姓を入力してください")
    end
    it 'ユーザー本名の名が空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名を入力してください")
    end
    it 'ユーザー本名の姓が半角だと保存できないこと' do
      @user.family_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("姓は全角で入力してください")
    end
    it 'ユーザー本名の名が半角だと保存できないこと' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("名は全角で入力してください")
    end
    it 'ユーザー本名の苗字のフリガナが空だと保存できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("姓(カナ)を入力してください")
    end
    it 'ユーザー本名の名前のフリガナが空だと保存できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名(カナ)を入力してください")
    end
    it 'ユーザー本名の姓のフリガナが漢字だと保存できないこと' do
      @user.first_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("名(カナ)は全角カタカナで入力してください")
    end
    it 'ユーザー本名の名のフリガナが漢字だと保存できないこと' do
      @user.family_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("姓(カナ)は全角カタカナで入力してください")
    end
    it '生年月日が空だと保存できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
  end
end
