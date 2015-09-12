# == Schema Information
#
# Table name: tasks
#
#  id                :integer          not null, primary key
#  name              :string
#  comment           :text
#  planning_id       :integer
#  completed         :boolean          default(FALSE)
#  theme_id          :integer
#  period            :integer
#  reference_task_id :integer
#

class Task < ActiveRecord::Base
	has_and_belongs_to_many :people
	belongs_to :planning

	enum period: ReferenceTask::PERIODS_MAP
end
