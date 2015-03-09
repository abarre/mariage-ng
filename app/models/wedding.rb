class Wedding < ActiveRecord::Base
  belongs_to :planning
  belongs_to :groom, :class_name => "Person"
  belongs_to :bride, :class_name => "Person"

  validates_presence_of :date, :bride, :groom

  validates :date, :date => { :after => Time.now, :before => Time.now + 4.year}
end
