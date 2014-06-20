class ReloudEntry < ActiveRecord::Base
  default_scope :order => 'reloud_entries.name ASC'
  attr_accessible :name
end
