class CreateOfficeCleaningsSchedules < ActiveRecord::Migration
  def change
    create_table :office_cleanings_schedules do |t|
      t.date :start_date
      t.date :end_date
      t.string :person

      t.timestamps
    end
  end
end
