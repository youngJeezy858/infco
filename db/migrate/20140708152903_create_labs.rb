class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :name

      t.timestamps
    end
  end
end
