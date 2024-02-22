class Booking < ApplicationRecord
  belongs_to :power
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }, presence: true

  def pending?
    status == 'pending'
  end
end
