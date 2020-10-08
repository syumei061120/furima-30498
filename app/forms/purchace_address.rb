class PurchaceAddress

  include ActiveModel::Model
  attr_accessor :user_id, :postal_code, :state_id, :city, :address_line, :building, :telephone, :token, :item_id
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :state_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address_line
    validates :telephone, format: {with: /\A[0-9]{,11}\z/, message: "hyphen(-)不要"}
    validates :token
  end

  def save
    purchace = Purchace.create(user_id: user_id, item_id: item_id )
    Address.create(purchace_id: purchace.id, postal_code: postal_code, state_id: state_id, city: city, address_line: address_line, building: building, telephone: telephone)
  end
end