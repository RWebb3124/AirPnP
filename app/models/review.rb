class Review < ApplicationRecord
  belongs_to :booking
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: (0..5), message: "%<value> is not a valid rating from 0 to 5" }
end
