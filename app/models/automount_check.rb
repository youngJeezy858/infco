class AutomountCheck < ActiveRecord::Base
  default_scope :order => 'automount_checks.name ASC'
  belongs_to :operations_check
  attr_accessible :name, :passed, :ticket
  
  validates_presence_of :ticket, :if => :failed?

  private
  def failed?
    !passed
  end
end
