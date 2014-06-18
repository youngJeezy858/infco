class ChangeDateTypeInInternalCheck < ActiveRecord::Migration
  def change
    change_column :internal_checks, :date, :date
  end
end
