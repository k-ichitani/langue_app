class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      
      t.integer :student_id, null: false
      t.integer :teacher_id, null: false
      t.datetime :start_time, null: false
      t.datetime :finish_time, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
