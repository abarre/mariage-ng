class Task < ActiveRecord::Base
	has_and_belongs_to_many :people
	belongs_to :planning

	enum period: ReferenceTask::PERIODS_MAP
end
