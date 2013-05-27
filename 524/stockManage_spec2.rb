require_relative 'stockManage2'

=begin
The firm can:
- Create a new client
- List clients


	
=end



# it "Client makes a portfolio"
# it "A client can create multiple portfolios"
# it "A client can buy stocks at market rate"

# it "Stocks will be added to a client portfolio"
# it "Client purchase subtract from cash their balance"
# it "Negative cash balance is not possible"

# it "A client can sell a stock"
# it "Proceeds go into clients account at sale"

# it "List all client portfolios and their values"
# it "List all stocks in a portfolio"
# it "List all clients"

# it "Calculate portfolio balance"
# it "Get current stock prices"




describe Firm do
  describe '#new' do
    it 'builds a new Firm with a name' do
      firm = Firm.new('TDDStock')
      firm.should be_instance_of Firm
      firm.name.should == 'TDDStock'
    end
  end

  describe '#addClient' do
    let(:firm) { Firm.new('TDDStock') }

    it 'creates a new client within the firm' do
      firm.addClient('Mike')
      firm.clients[:Mike].name.should == 'Mike'
    end
  end
end



describe Client do

  describe '#new' do
    it 'builds a new Client with a name' do
      client = Client.new('Mike')
      client.should be_instance_of Client
      client.name.should == 'Mike'
    end
  end

  describe '#addPortfolio' do
    #let(:firm) { Firm.new('TDDStock') }
    let(:client) { Client.new('Mike') }

    it 'creates a new portfolio for the client' do
      client.addPortfolio('myPortfolio')
      client.portfolios[:myPortfolio].name.should == 'myPortfolio'
    end
  end

end



describe Portfolio do
  describe '#new' do
    it 'builds a new Portfolio with a name' do
      portfolio = Portfolio.new('MyPortfolio')
      portfolio.should be_instance_of Portfolio
      portfolio.name.should == 'MyPortfolio'
    end
  end
end
=begin
  describe 'addStock' do
    let(:portfolio) { Portfolio.new('MyPortfolio') }

    it 'creates a new stock within a portfolio' do
      portfolio.addStock('AAPL', 1)
      portfolio.stocks[:AAPL][:id].should eq('AAPL')
      #create stock class, make sure it is an instance of stock. easier then to manage
    end
  end
=end





  describe 'addStock' do
  	#let(:firm) { Firm.new('TDDStock') }
  	let(:client) { Client.new('Mike') }
  	let(:portfolio) { Portfolio.new('MyPortfolio') }

  	it 'creates a new stock within a portfolio' do
  		portfolio.addStock('GA')
  		porfolio.stocks[:GA].name.should = 'GA'
  	end
  end
end

=begin
describe Stock do
	describe '#new' do
		it 'builds a new Stock with a name' do
			stock = Stock.new('GA')
			stock.should be_an_instance_of Stock
			stock.name.should == 'GA'
		end
	end
end
=end
