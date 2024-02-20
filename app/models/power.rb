class Power < ApplicationRecord
  belongs_to :user
  has_many :bookings

  CATEGORIES = ["strength", "agility", "magic", "mental", "summon"]

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true, inclusion: { in: Power::CATEGORIES }
  validates :price, presence: true, numericality: { only_float: true }
end
