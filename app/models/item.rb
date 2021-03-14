class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :paymentmethod
  belongs_to :prefecture
  belongs_to :delivery

  belongs_to :user
 #has_one :purchase
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :paymentmethod_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_id, numericality: { other_than: 1 }
end
