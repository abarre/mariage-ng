class CreatePlannings < ActiveRecord::Migration
  def change
    create_table :plannings do |t|

      t.timestamps null: false
    end
  end
end
