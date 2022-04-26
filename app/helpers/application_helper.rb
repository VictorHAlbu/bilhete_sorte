module ApplicationHelper
  #array total de milhar
  def total_of_thousands
    return @totalnumbers =  Ticket.all.map{|ticket| ticket.numbers_ticket }
  end

  #concaenando em único array
  def total_numbers_in_single_array
    total_of_thousands.flatten
  end

end
