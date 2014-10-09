require 'prime_numbers_table'

describe PrimeNumbersTable do
  before(:each) do
    @prime_numbers_table = PrimeNumbersTable.new(10)
  end

  describe "#print_table" do
    it "should return a multiplication table of prime numbers" do
      table = <<-doc
  X |  2 |  3 |   5 |   7 |  11 |  13 |  17 |  19 |  23 |  29 |
  2 |  4 |  6 |  10 |  14 |  22 |  26 |  34 |  38 |  46 |  58 |
  3 |  6 |  9 |  15 |  21 |  33 |  39 |  51 |  57 |  69 |  87 |
  5 | 10 | 15 |  25 |  35 |  55 |  65 |  85 |  95 | 115 | 145 |
  7 | 14 | 21 |  35 |  49 |  77 |  91 | 119 | 133 | 161 | 203 |
 11 | 22 | 33 |  55 |  77 | 121 | 143 | 187 | 209 | 253 | 319 |
 13 | 26 | 39 |  65 |  91 | 143 | 169 | 221 | 247 | 299 | 377 |
 17 | 34 | 51 |  85 | 119 | 187 | 221 | 289 | 323 | 391 | 493 |
 19 | 38 | 57 |  95 | 133 | 209 | 247 | 323 | 361 | 437 | 551 |
 23 | 46 | 69 | 115 | 161 | 253 | 299 | 391 | 437 | 529 | 667 |
 29 | 58 | 87 | 145 | 203 | 319 | 377 | 493 | 551 | 667 | 841 |
doc
      expect(@prime_numbers_table.print_table).to eql(table.chomp)
    end
  end

  describe "#is_prime?" do
    it "should return true if given number is a prime number" do
      expect(@prime_numbers_table.is_prime?(11)).to eql(true)
    end

    it "should return false if given number is not a prime number" do
      expect(@prime_numbers_table.is_prime?(3)).to eql(true)
    end

    it "should return false if given number is less than 1" do
      expect(@prime_numbers_table.is_prime?(-3)).to eql(false)
    end

    it "should return false if given number is 1" do
      expect(@prime_numbers_table.is_prime?(1)).to eql(false)
    end
  end

  describe "#generate_prime_numbers" do
    it "should generate an array of prime numbers for a given number" do
      expect(@prime_numbers_table.generate_prime_numbers(10)).to eql([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

    it "should generate an array of prime number starting from a given number" do
      expect(@prime_numbers_table.generate_prime_numbers(5, 4)).to eql([5, 7, 11, 13, 17])
    end
  end
end
