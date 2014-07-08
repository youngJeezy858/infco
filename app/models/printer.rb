class Printer < ActiveRecord::Base
  default_scope :order => 'printers.name ASC'
  attr_accessible :name
end
