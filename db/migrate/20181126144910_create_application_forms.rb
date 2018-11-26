class CreateApplicationForms < ActiveRecord::Migration[5.2]
  def change
    create_table :application_forms do |t|
      t.string :address
      t.references :varsity
      t.string :graduation_year
      t.references :student

      t.timestamps
    end
  end
end
