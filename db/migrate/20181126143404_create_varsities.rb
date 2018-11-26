class CreateVarsities < ActiveRecord::Migration[5.2]
  def change
    create_table :varsities do |t|
      t.string :name

      t.timestamps
    end
  end
end
