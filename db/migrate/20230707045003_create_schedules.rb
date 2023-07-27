class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|

      t.integer :teacher_id, null: false
      t.datetime :start_time, null: false
      t.datetime :finish_time, null: false
      t.timestamps
    end
  end
end
