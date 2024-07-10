class Pool < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo

  validates :address, presence: true, uniqueness: true, length: { minimum: 8 }
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 16 }
  validates :capacity, length: { in: 1..50 }, presence: true
  validates :price, presence: true # numericality: true, format: { with: /A\d{1,4}(\.\d{0,2})?z/ }
end
