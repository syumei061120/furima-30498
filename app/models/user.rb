class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :item
  has_one :purchace
  has_many :comments
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

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
