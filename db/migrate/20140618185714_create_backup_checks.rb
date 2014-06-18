class CreateBackupChecks < ActiveRecord::Migration
  def change
    create_table :backup_checks do |t|
      t.string :name
      t.boolean :passed
      t.integer :ticket_number
      t.references :internal_check

      t.timestamps
    end
    add_index :backup_checks, :internal_check_id
  end
end
