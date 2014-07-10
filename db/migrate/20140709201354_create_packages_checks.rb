class CreatePackagesChecks < ActiveRecord::Migration
  def change
    create_table :packages_checks do |t|
      t.string :name
      t.boolean :passed
      t.integer :ticket
      t.references :operations_check

      t.timestamps
    end
  end
end
