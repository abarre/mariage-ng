require 'rails_helper'

RSpec.describe ReferenceTask, :type => :model do
  describe "#determine_wedding_case" do
  	it "should return wedding_in_more_than_12_months if there is more than one year till the wedding" do
  		expect(ReferenceTask.determine_wedding_case(14.months.from_now.to_date)).to eq(:wedding_in_more_than_12_months)
  	end

  	it "should return wedding_in_more_than_12_months if there is more than one year till the wedding" do
  		expect(ReferenceTask.determine_wedding_case(12.months.from_now.to_date)).to eq(:wedding_in_12_months)
  	end

  	it "should return wedding_in_more_than_12_months if there is more than one year till the wedding" do
  		expect(ReferenceTask.determine_wedding_case(9.months.from_now.to_date)).to eq(:wedding_in_9_months)
  	end

  	it "should return wedding_in_more_than_12_months if there is more than one year till the wedding" do
  		expect(ReferenceTask.determine_wedding_case(15.days.from_now.to_date)).to eq(:wedding_in_1_month)
  	end
	end
end
