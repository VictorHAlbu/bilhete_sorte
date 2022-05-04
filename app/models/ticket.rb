class Ticket < ApplicationRecord

  before_save :generate_numbers_ticket
  validates_uniqueness_of :numbers_ticket
  validate :posts_count_within_limit, on: :create

  attr_accessor :numbers

  # Todas milhar
  def total_of_thousands
    return totalnumbers = Ticket.all.map{|ticket| ticket.numbers_ticket }
  end

  def total_numbers_in_single_array
    total_of_thousands.flatten
  end
  
  private
  
  def generate_numbers_ticket
    numbers = (0...4).collect { sprintf('%04d', rand(10000)) }.uniq
    check_milhar_exist(numbers)
    debugger
    self.numbers_ticket = numbers.to_a
  end
  
  
  def check_milhar_exist(array)
    if array.all? { |e| total_numbers_in_single_array.include?(e) }
      return errors[:numbers_ticket] << "Milhar já este!!! Por favor, crie outro Bilhete." 
    end
  end

  def posts_count_within_limit
    if total_numbers_in_single_array.count >= 10000
      errors.add(:base, 'Limite total de bilhetes vendidos.')
    end
  end


  
end
