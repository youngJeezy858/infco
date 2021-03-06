class RtCheck < ActiveRecord::Base
  belongs_to :operations_check
  attr_accessible :name, :passed, :ticket
  validates_presence_of :ticket, :if => :failed?

  private
  def failed?
    !passed
  end
end
