class CreateLabChecks < ActiveRecord::Migration
  def change
    create_table :lab_checks do |t|
      t.string :lab_name
      t.string :machine1_name
      t.boolean :machine1_passed
      t.integer :machine1_ticket
      t.string :machine2_name
      t.boolean :machine2_passed
      t.integer :machine2_ticket
      t.string :machine3_name
      t.boolean :machine3_passed
      t.integer :machine3_ticket
      t.boolean :completed
      t.references :operations_check

      t.timestamps
    end
  end
end
