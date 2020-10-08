class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_user
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_date

  belongs_to :user
  has_one_attached :image
  has_one :purchace

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    with_options numericality: { other_than: 0, message: 'Select' } do
      validates :category_id
      validates :status_id
      validates :postage_user_id
      validates :state_id
      validates :shipping_date_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end
end
