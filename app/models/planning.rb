# == Schema Information
#
# Table name: plannings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  wedding_id :integer
#

class Planning < ActiveRecord::Base
	has_many :tasks
	belongs_to :wedding

	validates_presence_of :wedding

	def generate_tasks
		wedding_case = ReferenceTask.determine_wedding_case wedding.date
		reference_tasks = ReferenceTask.all.select {|reference_task| reference_task.send(wedding_case) != "no" }
		reference_tasks.each do |reference_task|
			task = Task.new(
				name: reference_task.name,
				comment: reference_task.comment,
				theme_id: reference_task.theme_id,
				reference_task_id: reference_task.id,
				planning: self
			)

			case reference_task.assigned_person
			when "bride"
				task.people = [wedding.bride]
			when "groom"
				task.people = [wedding.groom]
			when "couple"
				task.people = [wedding.bride, wedding.groom]
			end

			period = reference_task.send(wedding_case)
			if period == "finished"
				task.completed = true
			else
				task.period = period
			end
			task.save!
		end
	end
end
