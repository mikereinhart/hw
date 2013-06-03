require 'yahoofinance'

class Firm

  attr_reader :clients
  attr_writer
  attr_accessor :name

  def initialize(name)
    @name = name
    @clients = {}
  end

  def addClient(name, cash = 0)
    #name.to_sym converts the string name to a symbol
    @clients[name.to_sym] = Client.new(name,cash)
  end

end



class Client

  attr_accessor :name, :cash, :portfolios

  def initialize(name, cash = 0)
    @name = name
    @portfolios = {}
  end

  def addPortfolio(name)
    @portfolios[name.to_sym] = Portfolio.new(name)
  end
end



class Portfolio

  attr_accessor :name, :owner, :stocks

  def initialize(name) #, owner)
    @name = name
    #owner =
    @stocks = {}
  end

=begin
Stuff below this comment needs to be fixed up. Origininally had stock as
a class. then i converted it to a hash. now i want to convert it back to 
a class. some tests need to be uncommented and confirmed before getting 
into more complex functions.
=end

  def addStock(stock, numShares)
  	#@stock takes an object of type Stock and type integer.
    price = Portfolio.getStockPrice(id)
    cost = price * numShares
    @stocks[stock.name.to_sym] = stock
    #@stocks[id.to_sym] = numShares
  end

  def self.getStockPrice(id)
    YahooFinance::get_quotes(YahooFinance::StandardQuote, id) [id].lastTrade
  end

end



class Stock

	attr_accessor :name

	def initialize(name)
		@name = name
	end

end

