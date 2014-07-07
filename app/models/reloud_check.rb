class ReloudCheck < ActiveRecord::Base
  default_scope :order => 'reloud_checks.date ASC'
  attr_accessible :date, :name, :owner
end
