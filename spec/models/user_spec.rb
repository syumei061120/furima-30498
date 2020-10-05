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
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに＠が含まれていないと保存できないこと' do
      @user.email = "testtest.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'emailが重複していると保存できないこと' do
      @user.save
      user2 = FactoryBot.build(:user, email:@user.email)
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では保存できないこと' do
      @user.password = "123ab"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが半角英語のみだと保存できないこと' do
      @user.password = "abcdef"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は6文字以上の英数混在で入力してください。")
    end
    it 'passwordが半角数字のみだと保存できないこと' do
      @user.password = "123456"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は6文字以上の英数混在で入力してください。")
    end
    it 'passwordと確認用パスワードが一致しないと保存できないこと' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    #  'ユーザー管理機能／新規登録（本人情報確認）' 
    it 'ユーザー本名の苗字が空だと保存できないこと' do
      @user.family_name = nil
      @user.valid?

      expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name Full-width characters.")
    end
    it 'ユーザー本名の名前が空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name Full-width characters.")
    end
    it 'ユーザー本名の苗字が半角だと保存できないこと' do
      @user.family_name = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name Full-width characters.")
    end
    it 'ユーザー本名の名前が半角だと保存できないこと' do
      @user.first_name = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters.")
    end
    it 'ユーザー本名の苗字のフリガナが空だと保存できないこと' do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana Full-width katakana characters.")
    end
    it 'ユーザー本名の名前のフリガナが空だと保存できないこと' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana Full-width katakana characters.")
    end
    it 'ユーザー本名の苗字のフリガナが漢字だと保存できないこと' do
      @user.first_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters.")
    end
    it 'ユーザー本名の名前のフリガナが漢字だと保存できないこと' do
      @user.family_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters.")
    end
    it '生年月日が空だと保存できないこと' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
