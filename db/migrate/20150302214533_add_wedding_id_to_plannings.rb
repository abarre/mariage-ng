class AddWeddingIdToPlannings < ActiveRecord::Migration
  def change
  	add_column :plannings, :wedding_id, :integer
  	add_index :plannings, :wedding_id
  end
end
