class LabCheck < ActiveRecord::Base
  default_scope :order => 'lab_checks.lab_name ASC'
  belongs_to :operations_check
  attr_accessible :completed, :lab_name, :machine1_name, :machine1_passed, :machine1_ticket, :machine2_name, :machine2_passed, :machine2_ticket, :machine3_name, :machine3_passed, :machine3_ticket
  
  validates_presence_of :machine1_ticket, :if => :failed1?
  validates_presence_of :machine2_ticket, :if => :failed2?
  validates_presence_of :machine3_ticket, :if => :failed3?

  def failed1?
    !machine1_passed
  end
  
  def failed2?
    !machine2_passed
  end

  def failed3?
    !machine3_passed
  end
end
