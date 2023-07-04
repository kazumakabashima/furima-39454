class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,         presence: true
  validates :password,                         format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/ } 
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯]+\z/ }
  validates :last_name_kanji,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龯]+\z/ }
  validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :last_name_kana,   presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :birth_day,        presence: true
end
