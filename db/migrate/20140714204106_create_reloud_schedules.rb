class CreateReloudSchedules < ActiveRecord::Migration
  def change
    create_table :reloud_schedules do |t|
      t.string :machine_name
      t.string :person

      t.timestamps
    end
  end
end
