class Machine < ActiveRecord::Base
  belongs_to :lab
  attr_accessible :name
end
