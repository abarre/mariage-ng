require 'rails_helper'

RSpec.describe Planning, :type => :model do
  describe "#generate_tasks" do

  	let(:planning) { create :planning}

  	it "should not generate tasks when the period is no" do
      ref_task = create(:reference_task, wedding_in_12_months: 23)
      planning.generate_tasks
  		expect(planning.tasks).to eq []
  	end

  	it "should assigned the task to the groom if the assigned_person is groom" do
      ref_task = create(:reference_task, assigned_person: 2)
      planning.generate_tasks
      expect(planning.tasks.first.people.length).to eq(1)
      expect(planning.tasks.first.people.first.name).to eq("Groom guy")
    end

    it "should assigned the task to the bride if the assigned_person is bride" do
      ref_task = create(:reference_task, assigned_person: 1)
      planning.generate_tasks
      expect(planning.tasks.first.people.length).to eq(1)
      expect(planning.tasks.first.people.first.name).to eq("Bride girl")
    end

  	it "should assigned the task to the bride and the groom if the assigned_person is couple" do
      ref_task = create(:reference_task, assigned_person: 0)
      planning.generate_tasks
      assigned_people = planning.tasks.first.people
      expect(assigned_people[0].name).to eq("Groom guy")
      expect(assigned_people[1].name).to eq("Bride girl")
    end
  	it "should create a completed tasks if the period is finished" do
      ref_task  = create(:reference_task, wedding_in_12_months: 24)
      planning.generate_tasks
      expect(planning.tasks.first.period).to eq(nil)
      expect(planning.tasks.first.completed).to be true
    end

    it "should assign the reference task that created the task" do
      ref_task  = create(:reference_task)
      planning.generate_tasks
      expect(planning.tasks.first.reference_task_id).to eq(ref_task.id)
    end
  end
end
