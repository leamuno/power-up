class User < ApplicationRecord
  has_one_attached :photo
  has_many :powers
  has_many :bookings
  has_many :bookings_as_owner, through: :powers, source: :bookings


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
