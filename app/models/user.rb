class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
      validates :nickname
      validates :email
      validates :password,      length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i } # 半角英数字
      validates :lastname,      format: { with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
      validates :firstname,     format: { with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
      validates :lastnamekana,  format: { with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
      validates :firstnamekana, format: { with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
      validates :birthdate
  end
end
