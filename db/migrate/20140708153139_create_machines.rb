class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name
      t.references :lab

      t.timestamps
    end
    add_index :machines, :lab_id
  end
end
