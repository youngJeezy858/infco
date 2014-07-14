class CreateWeeklySchedules < ActiveRecord::Migration
  def change
    create_table :weekly_schedules do |t|
      t.string :name
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday

      t.timestamps
    end
  end
end
