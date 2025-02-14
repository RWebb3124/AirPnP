class Pool < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo

  validates :address, presence: true, uniqueness: true, length: { minimum: 8 }
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 16 }
  validates :capacity, length: { in: 1..50 }, presence: true
  validates :price, presence: true # numericality: true, format: { with: /A\d{1,4}(\.\d{0,2})?z/ }
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: :address,
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_capacity,
    against: :capacity,
    using: {
      tsearch: { prefix: true }
    }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
