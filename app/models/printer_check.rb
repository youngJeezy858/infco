class PrinterCheck < ActiveRecord::Base
  default_scope :order => 'printer_checks.name ASC'
  belongs_to :operations_check
  attr_accessible :name, :passed, :ticket

  validates_presence_of :ticket, :if => :failed?

  def failed?
    !passed
  end
end
