class PrinterCheck < ActiveRecord::Base
  default_scope :order => 'printer_checks.name ASC'
  belongs_to :operations_check
  attr_accessible :name
end
