class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = {}
    end
  
    def add_item(title, price, quantity = 1)
      # Update the total by adding the price times quantity
      self.total += price * quantity
  
      # Add the items to the items array, considering quantity
      quantity.times { self.items << title }
  
      # Store the last transaction details
      self.last_transaction = {
        title: title,
        price: price,
        quantity: quantity
      }
    end
  
    def apply_discount
      if discount > 0
        # Calculate the discount amount
        discount_amount = (discount.to_f / 100) * total
  
        # Apply the discount to the total
        self.total -= discount_amount
  
        # Return a success message with the updated total
        "After the discount, the total comes to $#{total.to_i}."
      else
        # Return an error message if there is no discount
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      # Subtract the last transaction from the total
      self.total -= last_transaction[:price] * last_transaction[:quantity]
  
      # Remove the last transaction items from the items array
      last_transaction[:quantity].times { self.items.pop }
  
      # Clear the last_transaction details
      self.last_transaction = {}
    end
  end
  