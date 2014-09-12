class CreateOperationsChecks < ActiveRecord::Migration
  def change
    create_table :operations_checks do |t|
      t.string :owner
      t.string :signed_off_by

      t.timestamps
    end
  end
end
