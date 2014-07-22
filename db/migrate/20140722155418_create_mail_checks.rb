class CreateMailChecks < ActiveRecord::Migration
  def change
    create_table :mail_checks do |t|
      t.boolean :passed
      t.integer :ticket
      t.references :operations_check

      t.timestamps
    end
    add_index :mail_checks, :operations_check_id
  end
end
