module ApplicationHelper

  def link_to_rt(ticket, options={})
    if ticket.blank?
      ticket
    else
      link_to ticket, "https://rt002.lcsee.wvu.edu/request-tracker/Ticket/Display.html?id=#{ticket}", {:target => "_blank"}.merge(options)
    end
  end
  
end
