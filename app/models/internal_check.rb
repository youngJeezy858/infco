class InternalCheck < ActiveRecord::Base
  attr_accessible :date, :owner, :passed
  has_many :backup_checks
  has_many :space_checks

  #accepts_nested_attributes_for :backup_checks
  #attr_accessible :backup_checks_attributes
end
