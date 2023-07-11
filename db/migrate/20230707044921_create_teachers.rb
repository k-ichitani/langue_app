class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|

      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :email, null: false, unique: true
      t.string :telephone_number, null: false, unique: true
      t.string :encrypted_password, null: false, unique: true
      t.integer :specialty, null: false, array: true
      t.boolean :is_deleted, null: false, default: false
      t.timestamps
    end
  end
end
