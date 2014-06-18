class CreateInternalChecks < ActiveRecord::Migration
  def change
    create_table :internal_checks do |t|
      t.datetime :date
      t.string :owner
      t.boolean :passed

      t.timestamps
    end
  end
end
