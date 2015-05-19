class Wedding < ActiveRecord::Base
  belongs_to :planning
  belongs_to :groom, class_name: "Person", autosave: true
  belongs_to :bride, class_name: "Person", autosave: true

  validates_presence_of :date

  validates :date, :date => { :after => Time.now, :before => Time.now + 4.year}
end
