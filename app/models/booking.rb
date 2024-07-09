class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pool
  has_many :reviews
end
