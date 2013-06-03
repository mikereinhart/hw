require "yahoofinance"
require "pry"

class StockManagement

  attr_reader :name, :clients

  #make a new bank
  def initialize(name)
    @name = name
    @clients = []
  end

  #adds a client to the bank with a name and balance
  def newClient(name, cash)
    client = Client.new(name)
    client.cash = cash
    @clients << client
  end

  #method for getting access to a client?
  def getClient(name)
    @clients.each { |client| client.name == name}.first
  end

  def to_s
    printString = "\n #{name} \n"
    @clients.each { |cur| printString << "#{cur.name} has #{cur.balance}\n" }
    return
  end

  def displayClients
    puts @clients.map { |cur| "#{cur.name}"}.join(', ')
    return
  end
end



class Client

  attr_accessor :name, :cash, :portfolios

  #make a new client. the client has a name, total balance, and portfolios
  def initialize(name)
    @name = name
    @cash = nil
    @portfolios = []
  end

  #makes a new portfolio(of the class portfolio) for the client.
  #the portfolio is added tot he clients array of portfolios.
  #the new portfolio includes a stock and a number of shares.
  def newPortfolio(name, id, numShares)
    if Stock.new(id).price * numShares < @cash
      portfolio = Portfolio.new(name)
      cost = portfolio.addStock(id,numShares)
      @cash -= cost
      @portfolios << portfolio
    else
      puts 'Purchase price exceeds cash balance. Cannot complete transaction.'
    end

    def buyStock(portfolioName, id, numShares)
      portfolio = Portfolio.new.each n{ |port| port.name == portfolioName}.first

      if Stock.new(id).price * numShares < @cash
        cost = portfolio.addStock(id, numShares)
        @cash -= cost
      else
        puts 'Purchase price exceeds cash balance. Cannot complete transaction.'
      end
    end

    def sellStock(portfolioName, id, numShares)
      portfolio = @portfolios.each { |port| port.name == portfolioName}.first
      cost = portfolio.removeStock(id, numShares)
      @cash += cost
    end

    def update
      @portfolios.each do |portfolio|
        portBalance = 0
        portfolio.stocks.each do |stock|
          stock[:stock] = stock[:numShares] * (stock[:stock].update)
          portBalance += stock[:value]
        end
        portfolio.balance = portBalance
      end
    end

    def balance
      update
      balance = 0
      @portfolios.each do |portfolio|
        balance += portfolio.balance
      end
    end

  end




  class Portfolio

    attr_accessor :name, :stocks, :balance

    #makes a new portfolio. the stocks within the portfolio begins as an empty array.
    #the beginning balance for the new portfolio begins as nil
    def initialize(name)
      @name = name
      @stocks = []
      @balance = nil
    end

    #Adds a stock to a portfolio. Stocks is an array of the name(stock),
    #number of shares, cost, and value.
    def addStock(id, numShares)
      stock = Stock.new(id)
      cost = stock.price * numShares
      stocks << {:stock => stock, :numShares => numShares, :cost => cost, :value => cost}
      return cost
    end

    def removeStock(id, numShares)
      stock = @stocks.each { |stk| stk[:stock].id == id}.first
      stock[:stock].update
      cost = stock[:value] * numShares

      if numShares < stock[:numShares]
        stock[:numShares] -= numShares
      elsif numShares == stock[:numShares]
        @stocks.pop(stock)
      end

      stocks << {:stock => stock, :numShares => numShares, :cost => cost, :value => cost}
      return cost
    end

    def to_s
      printString = "#{@name} \n"
      @stocks.each { |stock| printString << "#{stock[:id]}: #{stock[:numShares]}: totalling #{stock[:value]}"}
      return printString
    end
  end



  class Stock

    attr_accessor :id, :price

    def initialize(id)
      @id = id
      @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @id) [@id].lastTrade
    end

    def update
      @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @id) [@id].lastTrade
      return price
    end
  end
end
