class RemoveDetailsFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :start_time, :datetime
    remove_column :reservations, :finish_time, :datetime
  end
end
