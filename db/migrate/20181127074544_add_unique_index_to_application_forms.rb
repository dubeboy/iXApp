class AddUniqueIndexToApplicationForms < ActiveRecord::Migration[5.2]
  def change
    remove_index :application_forms, column: :student_id
    add_index :application_forms, :student_id, unique: true
  end
end
