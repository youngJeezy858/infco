class CreateReloudEntries < ActiveRecord::Migration
  def change
    create_table :reloud_entries do |t|
      t.string :name

      t.timestamps
    end
  end
end
