class BackupCheck < ActiveRecord::Base
  default_scope :order => 'backup_checks.date ASC'
  belongs_to :internal_check
  attr_accessible :name, :passed, :ticket_number
end
