class LdapCheck < ActiveRecord::Base
  default_scope :order => 'ldap_checks.name ASC'
  belongs_to :operations_check
  attr_accessible :name
end
