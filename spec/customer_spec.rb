describe Customer do
  describe '#statement' do
    it 'return text format statement' do 
      movie = Movie.new('ABC', 1)
      rental = Rental.new(movie, 5)

      customer = Customer.new('Bing')
      customer.add_rental(rental)

      expect(customer.statement).to eq "Rental Record for Bing\n\tABC\t15\nAmount owed is 15\nYou earned 2 frequent renter points"
    end
  end
end
