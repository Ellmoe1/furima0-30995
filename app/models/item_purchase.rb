class ItemPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phoneno, :item_id, :user_id,:token
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phoneno,  format: {with: /\A\d{11}\z/}
    validates :item_id
    validates :user_id
    validates :token
  end
    validates :building, presence: false


  def save
    purchase = Purchase.create(item_id: item_id,user_id: user_id)
    Order.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,address: address,building: building,phoneno: phoneno,purchase_id: purchase.id)
  end

end