class Machine < ActiveRecord::Base
  default_scope :order => 'machines.name ASC'
  belongs_to :lab
  attr_accessible :name, :lab_id
end
