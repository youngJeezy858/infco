class CreateNagiosEntries < ActiveRecord::Migration
  def change
    create_table :nagios_entries do |t|
      t.string :name

      t.timestamps
    end
  end
end
