class CardDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :phone_number, :building_name, :user_id, :item_id, :card_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, massage: 'is invalid. Input only number' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :token
  end
  def save
    card = Card.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                    building_name: building_name, phone_number: phone_number, card_id: card.id)
  end
end
