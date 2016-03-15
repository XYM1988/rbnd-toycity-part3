require_relative "customer"
require_relative "product"

class Transaction
  attr_reader :id, :customer, :product
  attr_writer :product
  @@id = 0
  @@transactions = []
  def initialize(customer, product)
    @id = @@id
    @customer = customer
    @product = product
    @@id += 1
    @product.stock = @product.stock - 1
    @@transactions << self
  end
  
  def self.all
    @@transactions
  end
  
  def self.find(index)
    # Starts from 1
    return @@transactions[index - 1]
  end
  # New features: I added two more ways to find transaction
  def self.find_by_customer_name(customer_name)
    result = []
    @@transactions.each do |transaction|
      if transaction.customer.name == customer_name
        result << transaction
      end
    end
    return result
  end
  
  def self.find_by_product_title(product_title)
    result = []
    @@transactions.each do |transaction|
      if transaction.product.title == product_title
        result << transaction
      end
    end
    return result
  end
end