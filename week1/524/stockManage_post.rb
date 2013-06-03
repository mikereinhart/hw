#This program needs to run the yahoofinance gem and we use pry to de-bug.
require "yahoofinance"
require "pry"


#this class creates the bank itself.
class StockManagement

=begin
att_reader is slightly different from att_accessor. with attr_reader, 
you can only get, you cannot set (think getter/setter). This is done 
for security reasons. We don't want to be able to change the name of the bank!
=end
  attr_reader :name, :clients

=begin
This method makes the new bank. During initialization, the only necessary
attribute is the bank's name. The bank also has clients, which begins as an
empty array. 
=end
  def initialize(name)
    @name = name
    @clients = []
  end

=begin
This method makes a new client for the bank. When a new client is added,
we must know their name and how much cash they have (the client's attributes).
When the client is added, they are automatically added to the array of clients.
=end
  def newClient(name, cash)
    client = Client.new(name)
    client.cash = cash
    @clients << client
  end

=begin
This method, TTBOMK, retrieves one of the banks clients using their name.
Perhaps a better method name would be getClients?
=end  #method for getting access to a client?
  def getClient(name)
    @clients.each { |client| client.name == name}.first
  end


#This method prints information about the bank's clients.
  def to_s
    printString = "\n #{name} \n"
    @clients.each { |cur| printString << "#{cur.name} has #{cur.balance}\n" }
    return
  end

#Prints each clients name, in a list separated by commas.
  def displayClients
    puts @clients.map { |cur| "#{cur.name}"}.join(', ')
    return
  end
end


=begin
This is the class of clients. Clients can be considered a subclass of 
stockManagement, our bank. 
=end
class Client

=begin
Here we use attr_accessor, unlike with the class stockManagment. This is because
we want to be able to get and set a client's cash, portfolios, etc.
=end
  attr_accessor :name, :cash, :portfolios

  #make a new client. the client has a name, total cash, and portfolios, 
  #which begins as an empty array.
  def initialize(name)
    @name = name
    @cash = nil
    @portfolios = []
  end


=begin
This is an interesting method. Overall it makes a new portfolio, but note 
the if/else statement within the method. It says that if the total cost 
of the stocks in this portfolio is less than your clients total cash, only
then can the client make the portfolio. In that case, then the portfolio is
a new instance of the class portfolio, with its cost equal to returned cost
from the portfolio method 'addStock' (taking in the arguments of the stocks
id and the number of shares). The client's cash (@cost) is updated given 
the subtraction of the portfolio's cost.
=end
  def newPortfolio(name, id, numShares)
    if Stock.new(id).price * numShares < @cash
      portfolio = Portfolio.new(name)
      cost = portfolio.addStock(id,numShares)
      @cash -= cost
      @portfolios << portfolio
    else
      puts 'Purchase price exceeds cash balance. Cannot complete transaction.'
    end

=begin
This is also an interesting method worth diving into. It defines the method
for a client to buy stock. The first line of code defines the local variable
'portfolio.'s
=end
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
