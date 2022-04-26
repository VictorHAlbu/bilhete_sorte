class Ticket < ApplicationRecord

  before_save :generate_numbers_ticket
  
  attr_accessor :numbers

  # Todas milhar
  def total_of_thousands
    return totalnumbers = Ticket.all.map{|ticket| ticket.numbers_ticket }
  end

  def total_numbers_in_single_array
    total_of_thousands.flatten
  end

  def check_milhar_exist(numbers)
   value = numbers.find_all { |pos| numbers.count(pos) > 1 }    
  end

  
  private

  def generate_numbers_ticket

    numbers = (0...4).collect { sprintf('%04d', rand(10000)) }.uniq
    debugger
    self.numbers_ticket = numbers
  end

 

  
end
