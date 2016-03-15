require_relative "errors.rb"
require_relative "product.rb"
require_relative "transaction.rb"

class Customer
  attr_reader :name
  @@customers = []
  
  public
  
  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end
  
  def self.find_by_name(name)
    @@customers.each do |customer|
      if customer.name == name
        return customer
      end
    end
  end
  
  def self.all
    @@customers
  end

  def purchase(product)
    if product.stock == 0
      raise OutOfStockError, "'#{product.title}' is out of stock."
    else
      return Transaction.new(self, product)
    end
  end
  
  private
  
  def add_to_customers
    @@customers.each do |customer|
      if customer.name == @name
        raise DuplicateCustomerError.new, "'#{@name}' already exists"
      end
    end
    @@customers << self
  end
end