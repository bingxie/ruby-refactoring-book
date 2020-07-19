require 'spec_helper'

describe Customer do
  describe '#statement' do
    it 'return text format statement' do
      movie = Movie.new('ABC', RegularPrice.new)
      rental = Rental.new(movie, 5)

      customer = Customer.new('Bing')
      customer.add_rental(rental)

      expect(customer.statement).to eq "Rental Record for Bing\n\tABC\t6.5\nAmount owed is 6.5\nYou earned 1 frequent renter points"

      expect(customer.html_statement).to eq "<h1>Rentals for <em>Bing</em></h1><p>\n\tABC: 6.5<br>\n<p>You owe <em>6.5</em><p>\nOn this rental you earned <em>1</em> frequent renter points<p>"
    end

    it 'return text format statement' do
      movie = Movie.new('ABC', NewReleasePrice.new)
      rental = Rental.new(movie, 5)

      customer = Customer.new('Bing')
      customer.add_rental(rental)

      expect(customer.statement).to eq "Rental Record for Bing\n\tABC\t15\nAmount owed is 15\nYou earned 2 frequent renter points"

      expect(customer.html_statement).to eq "<h1>Rentals for <em>Bing</em></h1><p>\n\tABC: 15<br>\n<p>You owe <em>15</em><p>\nOn this rental you earned <em>2</em> frequent renter points<p>"
    end

    it 'return text format statement' do
      movie = Movie.new('ABC', ChildrensPrice.new)
      rental = Rental.new(movie, 5)

      customer = Customer.new('Bing')
      customer.add_rental(rental)

      expect(customer.statement).to eq "Rental Record for Bing\n\tABC\t4.5\nAmount owed is 4.5\nYou earned 1 frequent renter points"

      expect(customer.html_statement).to eq "<h1>Rentals for <em>Bing</em></h1><p>\n\tABC: 4.5<br>\n<p>You owe <em>4.5</em><p>\nOn this rental you earned <em>1</em> frequent renter points<p>"
    end
  end
end
