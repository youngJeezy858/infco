class InternalCheck < ActiveRecord::Base
  attr_accessible :date, :owner, :passed
  has_many :backup_checks
  has_many :space_checks
end
