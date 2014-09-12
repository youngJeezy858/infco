class LoudCheck < ActiveRecord::Base
  default_scope :order => 'created_at ASC'
  attr_accessible :name, :ticket

  def self.search(week)
    eow = DateTime.now.end_of_week
    bow = DateTime.now.beginning_of_week
    if week
      eow = week.to_datetime.end_of_week
      bow = week.to_datetime.beginning_of_week
    end
    where("created_at between ? and ?", bow, eow)
  end

end
