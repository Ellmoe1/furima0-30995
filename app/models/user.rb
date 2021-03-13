class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname,            presence: true
  validates :email,               presence: true
  validates :password,            presence: true, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i } # 半角英数字
  validates :lastname,            presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
  validates :firstname,           presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
  validates :lastnamekana,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
  validates :firstnamekana,       presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
  validates :birthdate,           presence: true
end
