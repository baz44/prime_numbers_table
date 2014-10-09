class PrimeNumbersTable

  def initialize(numbers=10)
    @numbers = numbers
  end

  def print_table
    @prime_numbers  = generate_prime_numbers(@numbers)
    return "No Prime numbers found." if @prime_numbers.empty?
    @table_body     = generate_table_body
    @columns_widths = get_columns_widths
    generate_table
  end

  def generate_prime_numbers(n, number=2)
    prime_numbers = []
    while prime_numbers.length < n
      prime_numbers << number if is_prime?(number)
      number += 1
    end
    prime_numbers
  end

  def is_prime?(number)
    return false if number <= 1
    (2..Math::sqrt(number)).each do |n|
      return false if number % n == 0
    end
    return true
  end

  private

  def generate_table
    table = []
    table << create_row(@prime_numbers.unshift("X")) # create table header
    @table_body.each_with_index do |row, i|
      table << create_row(row)
    end
    table.join("\n")
  end

  def generate_table_body
    @prime_numbers.reduce([]) do |body, number|
      body << generate_table_row(number)
    end
  end

  def generate_table_row(number)
    @prime_numbers.map {|n| n * number}.unshift(number)
  end

  def get_columns_widths
    @table_body.transpose.map {|number| number.max.to_s.length }
  end

  def create_row(row)
    line = ""
    row.each_with_index {|number, i| line << number.to_s.rjust(@columns_widths[i] + 1) + " |" }
    line
  end
end
