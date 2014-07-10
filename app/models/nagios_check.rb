class NagiosCheck < ActiveRecord::Base
  default_scope :order => 'nagios_checks.name ASC'
  belongs_to :operations_check
  attr_accessible :name
end
