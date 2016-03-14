# lib/product.rb
require_relative "errors.rb"

class Product
  attr_reader :title, :price, :stock
  attr_writer :stock
  @@products = []
  
  public
  
  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end
  
  def self.all
    @@products
  end
  
  def self.find_by_title(title)
    @@products.each do |product|
      if product.title == title
        return product
      end
    end
  end
  
  def in_stock?
    default_stock = 0
    @@products.each do |product|
      if product.title == @title
        default_stock = product.stock
      end
    end
    if default_stock == 0
      return false
    else
      return true
    end
  end
  
  def self.in_stock
    result = []
    @@products.each do |product|
      if product.stock != 0
        result.push(product)
      end
    end
    return result
  end
  
  private
  
  def add_to_products
    @@products.each do |product|
      if product.title == @title
        raise DuplicateProductError.new, "#{@title} already exists."
      end
    end
    @@products << self
  end
end