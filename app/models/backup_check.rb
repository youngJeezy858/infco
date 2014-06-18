class BackupCheck < ActiveRecord::Base
  belongs_to :internal_check
  attr_accessible :name, :passed, :ticket_number
end
