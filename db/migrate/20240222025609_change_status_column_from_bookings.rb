class ChangeStatusColumnFromBookings < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :status, :boolean, :default => nil

  end
end
