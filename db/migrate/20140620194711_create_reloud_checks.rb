class CreateReloudChecks < ActiveRecord::Migration
  def change
    create_table :reloud_checks do |t|
      t.string :name
      t.string :owner

      t.timestamps
    end
  end
end
