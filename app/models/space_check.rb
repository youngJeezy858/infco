class SpaceCheck < ActiveRecord::Base
  default_scope :order => 'space_checks.name ASC'
  belongs_to :internal_check
  attr_accessible :name, :passed, :ticket_number
end
