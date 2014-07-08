class Automount < ActiveRecord::Base
  default_scope :order => 'automounts.name ASC'
  attr_accessible :name
end
