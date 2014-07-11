class OperationsCheck < ActiveRecord::Base
  has_many :lab_checks 
  has_many :printer_checks
  has_many :automount_checks
  has_many :nagios_checks
  has_many :load_balancer_checks
  has_many :ldap_checks
  has_one :rt_check
  has_one :packages_check
  attr_accessible :date, :string, :signed_off_by
end
