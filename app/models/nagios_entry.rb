class NagiosEntry < ActiveRecord::Base
  default_scope :order => 'nagios_entries.name ASC'
  attr_accessible :name
end
