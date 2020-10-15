class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email,           format: { with: /@/}
         validates :password,        length: { minimum: 6 }, confirmation: true,  format: { with: /\A[a-zA-Z0-9]+\z/ }
         validates :nickname,        presence: true
         validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birthday,        presence: true

end
