class PlanningSerializer < ActiveModel::Serializer
  attributes :id, :wedding
  has_many :tasks

  def tasks
    object.tasks.includes(:people)
  end
end
