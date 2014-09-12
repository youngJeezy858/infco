class InternalCheck < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  attr_accessible :owner, :passed
  has_many :backup_checks
  has_many :space_checks

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
