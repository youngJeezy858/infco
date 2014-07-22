class ReloudCheck < ActiveRecord::Base
  default_scope :order => 'reloud_checks.date ASC'
  attr_accessible :date, :name, :owner

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
