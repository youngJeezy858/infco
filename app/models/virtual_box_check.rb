class VirtualBoxCheck < ActiveRecord::Base
  default_scope :order => 'date ASC'
  attr_accessible :date, :name, :ticket

  def self.search(week)
    eow = Date.today.at_end_of_week
    bow = Date.today.at_beginning_of_week
    if week
      eow = week.to_date.at_end_of_week
      bow = week.to_date.at_beginning_of_week
    end
    where("date between ? and ?", bow, eow)
  end

end
