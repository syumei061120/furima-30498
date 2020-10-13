class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :item
  has_one :purchace

  name_validation = /\A[ぁ-んァ-ン一-龥]/
  name_kana_validation = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: name_validation, message: 'は全角で入力してください' }
    validates :first_name, format: { with: name_validation, message: 'は全角で入力してください' }
    validates :family_name_kana, format: { with: name_kana_validation, message: 'は全角カタカナで入力してください' }
    validates :first_name_kana, format: { with: name_kana_validation, message: 'は全角カタカナで入力してください' }
    validates :birthday
  end

  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, message: 'は英字と数字の両方を含めて設定してください'
end
