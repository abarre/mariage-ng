class CreateReferenceTasks < ActiveRecord::Migration
  def change
    create_table :reference_tasks do |t|
    	t.string :name
      t.text 	 :comment
      t.integer :theme_id
      t.integer :assigned_person
      t.integer :wedding_in_more_than_12_months
      t.integer :wedding_in_12_months
      t.integer :wedding_in_11_months
      t.integer :wedding_in_10_months
      t.integer :wedding_in_9_months
      t.integer :wedding_in_8_months
      t.integer :wedding_in_7_months
      t.integer :wedding_in_6_months
      t.integer :wedding_in_5_months
      t.integer :wedding_in_4_months
      t.integer :wedding_in_3_months
      t.integer :wedding_in_2_months
      t.integer :wedding_in_1_month
    end
  end
end