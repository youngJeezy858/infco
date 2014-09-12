class OperationsCheck < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  has_many :lab_checks 
  has_many :printer_checks
  has_many :automount_checks
  has_many :nagios_checks
  has_many :load_balancer_checks
  has_many :ldap_checks
  has_one :rt_check
  has_one :packages_check
  has_one :mail_check
  attr_accessible :string, :signed_off_by

  def complete?
    labs_unchecked = Lab.select("name").map(&:name) -
      self.lab_checks.select("lab_name").map(&:lab_name)
    printers = Printer.select("name").map(&:name) -
      self.printer_checks.select("name").map(&:name)
    automounts = Automount.select("name").map(&:name) -
      self.automount_checks.select("name").map(&:name)
    nagios_entries = NagiosEntry.select("name").map(&:name) -
      self.nagios_checks.select("name").map(&:name)
    load_balancers = LoadBalancer.select("name").map(&:name) -
      self.load_balancer_checks.select("name").map(&:name)
    ldap_entries = LdapEntry.select("name").map(&:name) -
      self.ldap_checks.select("name").map(&:name)

    labs_unchecked.any? or printers.any? or automounts.any? or
      nagios_entries.any? or load_balancers.any? or ldap_entries.any? or
      self.rt_check.blank? or self.packages_check.blank? or 
      self.mail_check.blank?
  end

  def failures?
    self.lab_checks.each do |lab_check|
      return false unless lab_check.machine1_passed? and lab_check.machine2_passed? and 
          lab_check.machine3_passed?
    end
    
    self.printer_checks.each do |printer_check|
      return false unless printer_check.passed?
    end

    self.automount_checks.each do |automount_check|
      return false unless automount_check.passed?
    end
    
    self.nagios_checks.each do |nagios_check|
      return false unless nagios_check.passed?
    end

    self.load_balancer_checks.each do |load_balancer_check|
      return false unless load_balancer_check.passed?
    end
        
    self.ldap_checks.each do |ldap_check|
      return false unless ldap_check.passed?
    end    

    unless self.rt_check.nil? or self.rt_check.passed?
      return false
    end

    unless self.mail_check.nil? or self.mail_check.passed?
      return false
    end

    unless self.packages_check.nil? or self.packages_check.passed?
      false
    else
      true
    end
  end

  def self.search(owner)
    if owner
      if owner == "all"
        all()
      else
        find(:all, :conditions => ['owner LIKE ?', "%#{owner}%"])
      end
    else
      limit(20)
    end
  end

end
