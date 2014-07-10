class LabCheck < ActiveRecord::Base
  default_scope :order => 'lab_checks.lab_name ASC'
  belongs_to :operations_check
  attr_accessible :completed, :lab_name, :machine1_name, :machine2_name, :machine3_name
  validates :machine1_name, :uniqueness => { :scope => :machine2_name, :message => "Cannot use the same machine twice!" }
  validates :machine2_name, :uniqueness => { :scope => :machine3_name, :message => "Cannot use the same machine twice!" }
  validates :machine3_name, :uniqueness => { :scope => :machine1_name, :message => "Cannot use the same machine twice!" }
end
