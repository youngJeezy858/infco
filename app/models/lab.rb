class Lab < ActiveRecord::Base
  default_scope :order => 'labs.name ASC'
  has_many :machines
  attr_accessible :name
end
