class LoadBalancer < ActiveRecord::Base
  default_scope :order => 'load_balancers.name ASC'
  attr_accessible :name
end
