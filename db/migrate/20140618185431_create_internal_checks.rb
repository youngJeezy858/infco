class CreateInternalChecks < ActiveRecord::Migration
  def change
    create_table :internal_checks do |t|
      t.string :owner
      t.string :signed_off_by
      t.boolean :passed

      t.timestamps
    end
  end
end
