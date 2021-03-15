class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :orders

  with_options presence: true do
    validates :nickname
    validates :email
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password,   length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' } # 半角英数字
    # ユーザー本名全角の正規表現
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
      validates :lastname
      validates :firstname
    end
    # フリガナ全角の正規表現
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :lastnamekana
      validates :firstnamekana
    end
    validates :birthdate
  end
end
