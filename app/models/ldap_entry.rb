class LdapEntry < ActiveRecord::Base
  default_scope :order => 'ldap_entries.name ASC'
  attr_accessible :name
end
