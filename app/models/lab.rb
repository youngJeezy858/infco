class Lab < ActiveRecord::Base
  has_many :machines
  attr_accessible :name
end
