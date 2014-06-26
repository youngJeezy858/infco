class ReloudCheck < ActiveRecord::Base
  default_scope :order => 'backup_checks.date ASC'
  attr_accessible :date, :name, :owner
end
