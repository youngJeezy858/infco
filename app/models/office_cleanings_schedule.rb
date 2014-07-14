class OfficeCleaningsSchedule < ActiveRecord::Base
  default_scope :order => 'office_cleanings_schedules.start_date ASC'
  attr_accessible :end_date, :person, :start_date
end
