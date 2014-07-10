class LabCheck < ActiveRecord::Base
  default_scope :order => 'lab_checks.lab_name ASC'
  belongs_to :operations_check
  attr_accessible :completed, :lab_name, :machine1_name, :machine2_name, :machine3_name
end
