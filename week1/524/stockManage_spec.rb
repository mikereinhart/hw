

require_relative 'stockManage'


describe StockManagement do

  describe '#new' do
    it 'builds a new StockManagement (master firm) with a name' do
      stockManagement = StockManagement.new('TDDStock')
      stockManagement.should be_instance_of StockManagement
      stockManagement.name.should == 'TDDStock'
    end
  end

  describe '#newClient' do
    it 'Create an account for client (name, cash)' do
      stockManagement = StockManagement.new('MrStockyManager')
      name = "joe"
      balance = 500000000000000
      stockManagement.newClient(name, balance)
      stockManagement.getClient(name).name.should == name
    end
  end

  describe '#newPortfolio' do
    it 'Client makes a portfolio' do
      stockManagement = StockManagement.new('MrStockyManager')
      name = "joe"
      balance = 5000000000000000
      id = "AAPL"
      numShares = 2
      portName = 'MyPortfolio'
      stockManagement.newClient(name, balance)
      stockManagement.getClient(name).newPortfolio(portName, id, numShares)
      stockManagement.getClient(name).portfolios[0].stocks[0][:stock].id.should == id
    end

    it "make multiple portfolio" do
      stockManagement = StockManagement.new('MrStockyManager')
      name = "Joe"
      stockManagement.newClient(name, 500000000000000)
      stockManagement.getClient(name).newPortfolio("Port1", "AAPL", 2)
      stockManagement.getClient(name).newPortfolio("Port2", "GE", 2)
      stockManagement.getClient(name).portfolios.length == 2
    end

    it "buy multiple stocks in a portfolio" do
      stockManagement = StockManagement.new('MrStockyManager')
      name = "Joe"
      stockManagement.newClient(name, 500000000000000)
      stockManagement.getClient(name).newPortfolio("Port1", "AAPL", 2)
      stockManagement.getClient(name).portfolios[0].addStock("GE", 2)
      stockManagement.getClient(name).portfolios[0].stocks.length.should == 2
    end
  end

  describe '#exchange money' do
    it "Client purchase subtracts from client cash" do
      stockManagement = StockManagement.new('MrStockyManager')
      name = "Joe"
      startingCash = 5000000000000000
      stockManagement.newClient(name, startingCash)
      stockManagement.getClient(name).newPortfolio("Port1", "AAPL", 2)
      stockManagement.getClient(name).cash.should < startingCash
    end

    it "Client sells more shares for $" do
      stockManagement = StockManagement.new('MrStockyManager')
      name = "Joe"
      startingCash = 5000000000000000
      stockManagement.newClient(name, startingCash)
      stockManagement.getClient(name).newPortfolio("Port1", "AAPL", 2)
      cashAfterBuy = stockManagement.getClient(name).cash
      stockManagement.getClient(name).sellStock("Port1", "AAPL", 1)
      cashAfterSell = stockManagement.getClient(name).cash
      cashAfterBuy.should < cashAfterSell
    end

    it "protects against negative cash" do
      stockManagement = StockManagement.new('MrStockyManager')
      name = "Joe"
      stockManagement.newClient(name, 5)
      stockManagement.getClient(name).newPortfolio("Port1", "AAPL", 1000000000)
      stockManagement.getClient(name).portfolios.length.should == 0
    end
  end

  describe '#exchange stocks' do
    it "Client sells more shares" do
      stockManagement = StockManagement.new('MrStockyManager')
      name = "Joe"
      startingCash = 50000000000000000
      stockManagement.newClient(name, startingCash)
      stockManagement.getClient(name).newPortfolio("Port1", "AAPL", 2)
      stockManagement.getClient(name).sellStock("Port1", "AAPL", 1)
      stockManagement.getClient(name).portfolios[0].stocks[0][:numShares].should == 1
    end
  end

  describe '#updates stocks' do
    it 'stock price upate' do
      stockManagement = StockManagement.new('MrStockyManager')
      name = "Joe"
      stockManagement.newClient(name, 500)
      stockManagement.getClient(name).newPortfolio("Port1", "AAPL", 100)
      stockManagement.getClient(name).update
    end
  end

  describe '#print lists' do
    it 'show all stocks in a portfolio' do
      stockManagement = StockManagement.new('MrStockyManager')
      name = "Joe"
      stockManagement.newClient(name, 500)
      stockManagement.getClient(name).newPortfolio("Port1", "AAPL", 100)
      puts stockManagement.getClient(name).portfolios[0]
    end

    it "show clients and balance" do
      stockManagement = StockManagement.new('MrStockyManager')
      stockManagement.newClient("Joe", 500)
      stockManagement.newClient("Tina", 1003)
      stockManagement.getClient("Joe").newPortfolio("Port1", "AAPL", 2)
      stockManagement.getClient("Tina").newPortfolio("Port1", "GE", 3)
      stockManagement.getClient("Joe").portfolios[0].addStock("GE", 10)
      stockManagement.getClient("Tina").newPortfolio("Port1", "AAPL", 4)
      puts stockManagement
    end

    it "show clients and balance" do
      stockManagement = StockManagement.new('MrStockyManager')
      stockManagement.newClient("Joe", 500)
      stockManagement.newClient("Tina", 1003)
      stockManagement.getClient("Joe").newPortfolio("Port1", "AAPL", 2)
      stockManagement.getClient("Tina").newPortfolio("Port1", "GE", 3)
      stockManagement.getClient("Joe").portfolios[0].addStock("GE", 10)
      stockManagement.getClient("Tina").newPortfolio("Port1", "AAPL", 4)
      stockManagement.displayClients
    end
  end
end
  # it "Client makes a portfolio" ok
  # it "A client can create multiple portfolios"  ok
  # it "A client can buy stocks at market rate" ok

  # it "Stocks will be added to a client portfolio" ok
  # it "Client purchase subtract from cash their balance" ok
  # it "Negative cash balance is not possible" ok

  # it "A client can sell a stock" ok
  # it "Proceeds go into clients account at sale" ok

  # it "List all client portfolios and their values" ok
  # it "List all stocks in a portfolio" ok
  # it "List all clients" ok

  # it "Calculate portfolio balance" ok
  # it "Get current stock prices" ok
