require 'pry'
class CashRegister
  attr_accessor :discount, :total


  def initialize(discount=0)
    @discount = discount
    @total = 0
    @prices = []
    @cart = []
    @last_transaction_quantity = 1
  end

  def total
    @total.to_f
  end

  def add_item(title, price, quantity = 1)
    quantity.times {|i| @prices << price}
    @total = @prices.sum
    quantity.times {|i| @cart << title}
    @last_transaction_quantity = quantity

  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else self.total = (@total * (1 - @discount.to_f/100))
      "After the discount, the total comes to $800."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    @last_transaction_quantity.times {|i| @prices.pop}
    @last_transaction_quantity.times {|i| @cart.pop}
    @total = @prices.sum.to_f

  end


end