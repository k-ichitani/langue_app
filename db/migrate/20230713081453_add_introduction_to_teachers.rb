class AddIntroductionToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :introduction, :text
  end
end
