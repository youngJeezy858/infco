class WeeklySchedule < ActiveRecord::Base
  default_scope :order => 'weekly_schedules.name ASC'
  attr_accessible :friday, :monday, :name, :thursday, :tuesday, :wednesday
end
