class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
			t.string  :name
	    t.text    :comment
	    t.integer :planning_id
	    t.boolean :completed,        :default => false
	    t.integer :theme_id
	    t.integer :period
	    t.integer :reference_task_id
    end
  end
end
