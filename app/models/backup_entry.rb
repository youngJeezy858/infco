class BackupEntry < ActiveRecord::Base
  default_scope :order => 'backup_entries.name ASC'
  attr_accessible :name
end
