class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pool
  has_many :reviews, dependent: :destroy

  enum status: { pending: 0, accepted: 1, rejected: 2 }
end
