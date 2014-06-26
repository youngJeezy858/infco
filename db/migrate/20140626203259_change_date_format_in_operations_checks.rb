class ChangeDateFormatInOperationsChecks < ActiveRecord::Migration
  def up
    change_column :operations_checks, :date, :datetime
  end

  def down
    change_column :operations_checks, :date, :date
  end
end
