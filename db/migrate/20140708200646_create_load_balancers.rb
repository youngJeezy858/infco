class CreateLoadBalancers < ActiveRecord::Migration
  def change
    create_table :load_balancers do |t|
      t.string :name

      t.timestamps
    end
  end
end
