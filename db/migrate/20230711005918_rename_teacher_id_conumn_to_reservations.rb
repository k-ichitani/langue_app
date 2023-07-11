class RenameTeacherIdConumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :teacher_id, :schedule_id
  end
end
