# == Schema Information
#
# Table name: weddings
#
#  id       :integer          not null, primary key
#  date     :date
#  groom_id :integer
#  bride_id :integer
#
# Indexes
#
#  index_weddings_on_bride_id  (bride_id)
#  index_weddings_on_groom_id  (groom_id)
#

class Wedding < ActiveRecord::Base
  belongs_to :planning
  belongs_to :groom, class_name: "Person", autosave: true
  belongs_to :bride, class_name: "Person", autosave: true

  validates_presence_of :date

  validates :date, :date => { :after => Time.now, :before => Time.now + 4.year}
end
