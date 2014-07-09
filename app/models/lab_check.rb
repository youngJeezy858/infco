class LabCheck < ActiveRecord::Base
  attr_accessible :completed, :lab_name, :machine1_name, :machine2_name, :machine3_name
end
