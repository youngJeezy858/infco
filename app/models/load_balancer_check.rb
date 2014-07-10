class LoadBalancerCheck < ActiveRecord::Base
  default_scope :order => 'load_balancer_checks.name ASC'
  belongs_to :operations_check
  attr_accessible :name
end
