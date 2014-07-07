class CreateOperationsChecks < ActiveRecord::Migration
  def change
    create_table :operations_checks do |t|
      t.string :owner
      t.date :datetime

      t.timestamps
    end
  end
end
