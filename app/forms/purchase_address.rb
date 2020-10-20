class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :postal_code, :state_id, :city, :address_line, :building, :telephone, :token, :item_id
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'を正しい形式で入力して下さい' }
    validates :state_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :address_line
    validates :telephone, format: { with: /\A[0-9]{10,11}\z/, message: 'は数字のみ入力してください' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: purchase.id, postal_code: postal_code, state_id: state_id, city: city, address_line: address_line, building: building, telephone: telephone)
  end
end
