class AddStudentFieldsToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :first_name, :string,  null: false, default: ""
    add_column :students, :last_name, :string,  null: false, default: ""
    add_column :students, :phone, :string,  null: false, default: ""
  end
end
