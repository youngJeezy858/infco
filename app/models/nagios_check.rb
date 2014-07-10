class NagiosCheck < ActiveRecord::Base
  default_scope :order => 'nagios_checks.name ASC'
  belongs_to :operations_check
  attr_accessible :name, :passed, :ticket

  validates_presence_of :ticket, :if => :failed?

  private
  def failed?
    !passed
  end
end
