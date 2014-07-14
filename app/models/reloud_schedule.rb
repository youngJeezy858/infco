class ReloudSchedule < ActiveRecord::Base
  default_scope :order => 'reloud_schedules.machine_name ASC'
  attr_accessible :machine_name, :person
end
