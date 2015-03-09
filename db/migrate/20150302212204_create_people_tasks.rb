class CreatePeopleTasks < ActiveRecord::Migration
  def change
    create_table :people_tasks, :id => false do |t|
    	t.references :task
    	t.references :person
    end
    add_index :people_tasks, [:task_id, :person_id]
    add_index :people_tasks, :person_id
  end
end
