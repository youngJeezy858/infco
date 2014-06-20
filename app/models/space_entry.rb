class SpaceEntry < ActiveRecord::Base
  default_scope :order => 'space_entries.name ASC'
  attr_accessible :name
end
