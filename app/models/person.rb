# == Schema Information
#
# Table name: people
#
#  id   :integer          not null, primary key
#  name :string
#

class Person < ActiveRecord::Base
	has_and_belongs_to_many :tasks

	validates_presence_of :name
end
