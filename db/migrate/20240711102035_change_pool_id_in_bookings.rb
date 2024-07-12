class ChangePoolIdInBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_null :bookings, :pool_id, true
  end
end
