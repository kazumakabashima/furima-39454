class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,         presence: true
  validates :password,                         format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_kanji,  presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :last_name_kana,   presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :birth_day,        presence: true
end
