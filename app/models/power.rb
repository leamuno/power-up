class Power < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo


  CATEGORIES = ["strength", "agility", "magic", "mental", "summon", "transformation", "equipment"]

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true, inclusion: { in: Power::CATEGORIES }
  validates :price, presence: true, numericality: { only_float: true }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
