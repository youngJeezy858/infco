class CreatePrinterChecks < ActiveRecord::Migration
  def change
    create_table :printer_checks do |t|
      t.string :name
      t.references :operations_check

      t.timestamps
    end
  end
end
