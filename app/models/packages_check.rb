class PackagesCheck < ActiveRecord::Base
  belongs_to :operations_check
  attr_accessible :name
end
