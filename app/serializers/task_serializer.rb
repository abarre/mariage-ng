class TaskSerializer < ActiveModel::Serializer
  attributes :comment, :completed, :id, :name, :period, :planning_id, :reference_task_id, :theme_id
  has_many :people
end
