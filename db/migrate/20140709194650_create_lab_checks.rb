class CreateLabChecks < ActiveRecord::Migration
  def change
    create_table :lab_checks do |t|
      t.string :lab_name
      t.string :machine1_name
      t.string :machine2_name
      t.string :machine3_name
      t.boolean :completed
      t.references :operations_check

      t.timestamps
    end
  end
end
