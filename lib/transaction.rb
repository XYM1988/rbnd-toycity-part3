require_relative "customer"
require_relative "product"

class Transaction
  attr_reader :id, :customer, :product
  @@id = 0
  
  def initialize(customer, product)
    @id = @@id
    @customer = customer
    @product = product
    @@id += 1
    @product.stock = @product.stock - 1
  end
end