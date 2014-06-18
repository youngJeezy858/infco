class CreateSpaceEntries < ActiveRecord::Migration
  def change
    create_table :space_entries do |t|
      t.string :name

      t.timestamps
    end
  end
end
