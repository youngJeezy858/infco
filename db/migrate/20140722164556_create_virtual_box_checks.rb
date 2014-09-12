class CreateVirtualBoxChecks < ActiveRecord::Migration
  def change
    create_table :virtual_box_checks do |t|
      t.string :name
      t.integer :ticket

      t.timestamps
    end
  end
end
