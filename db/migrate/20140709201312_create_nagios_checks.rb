class CreateNagiosChecks < ActiveRecord::Migration
  def change
    create_table :nagios_checks do |t|
      t.string :name
      t.references :operations_check

      t.timestamps
    end
  end
end
