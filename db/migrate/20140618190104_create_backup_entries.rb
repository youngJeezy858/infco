class CreateBackupEntries < ActiveRecord::Migration
  def change
    create_table :backup_entries do |t|
      t.string :name

      t.timestamps
    end
  end
end
