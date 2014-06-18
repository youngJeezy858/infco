class CreateSpaceChecks < ActiveRecord::Migration
  def change
    create_table :space_checks do |t|
      t.string :name
      t.boolean :passed
      t.integer :ticket_number
      t.references :internal_check

      t.timestamps
    end
    add_index :space_checks, :internal_check_id
  end
end
