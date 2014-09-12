class RenameTableVirtualBoxChecksToLoudChecks < ActiveRecord::Migration
  def change
    rename_table :virtual_box_checks, :loud_checks
  end
end
