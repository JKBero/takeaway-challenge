class TakeAway
  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total_price = 0
    @user_mobile = ""
  end

  def read_menu
    @menu.display
  end

  def order(dish, quantity = 1)
    quantity.times{ @basket << @menu.display.slice(dish) }
    "#{quantity}x #{dish.downcase}(s) added to your basket"
  end

  def basket_summary
    @basket
    # Not passing the tests in the desired format...
    # ...skipped step due to time constraints
  end

  def total
    total_price
    "Your total order is £#{@total_price}"
  end

  def checkout
    puts "Please enter your mobile telephone number"
    @user_mobile = gets.chomp
  end

  def complete_order(amount)
    message = "Incorrect checkout price given. Please recheck your order total"
    raise message if incorrect_price?(amount)
  end

  private

  def total_price
    @basket.each do |item|
      item.each { |dish, price| @total_price += price }
    end
  end

  def incorrect_price?(amount)
    @total_price != amount
  end

end
