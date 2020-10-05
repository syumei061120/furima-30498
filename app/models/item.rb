class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :postage_user_id
    validates :state_id
    validates :shipping_date_id
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number' }
  end

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :postage_user_id
    validates :state_id
    validates :shipping_date_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
