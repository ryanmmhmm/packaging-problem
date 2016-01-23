
## Quote is a class that is designed to recieve input from one or many
## sources.  It requires an object and recognizes Hashes with keys for
## cost, people and product_type.  A Hash was chosen for input so that
## the class can interface easily with JSON or other sources and will
## only utilize the parts of the input data that it needs.
##
## The main purpose of this class is to parse and format input data
## so that it can be used and manipulated by other classes.

class Quote
  attr_reader :quote, :cost, :people, :product_type

  def initialize(unformatted_input)
    @quote = unformatted_input
    @cost = @quote[:cost]
    @people = @quote[:people]
    @product_type = @quote[:product_type]

    self.format_attributes
  end

  def format_cost
    @cost.tr!(' ','')
    @cost.slice!(0) if @cost[0] == "$"
    @cost = @cost.to_f
  end

  def format_people
    @people.downcase!
    @people.tr!(' ','')
    @people.tr!('a-z','')
    @people = @people.to_i
  end

  def format_product_type
    @product_type.tr!(' ','')
    @product_type.downcase!
    @product_type
  end

  def format_attributes
    @cost = format_cost
    @people = format_people
    @product_type = format_product_type
  end
end

## Price is a class that accepts pre-formatted input to be used with the
## Quote class.  It accepts an object with attributes of cost, people and
## product_type.
##
## The main purpose of this class is to calculate markup and the total
## price on an order.
##
## Properly formatted output is available through the
## formatted_total_price method.


class Price

  attr_reader :order, :base_markup, :manpower_markup_percent, :product_markup_percent, :total_price

  def initialize(order)
    @order = order
    @base_markup = calculate_base_markup
    @product_markup_percent = calculate_product_markup
    @manpower_markup_percent = calculate_manpower_markup
    @total_price = calculate_total_price.round(2)
  end

  def calculate_base_markup
    base_markup_percent = 0.05
    @order.cost * (1 + base_markup_percent)
  end

  def calculate_product_markup

    ## Case statement was used here because it remains extensible
    ## without having to use class inheritance to define products.
    case @order.product_type
    when 'drugs'
      0.075
    when 'food'
      0.13
    when 'electronics'
      0.02
    else
      0
    end
  end

  def calculate_manpower_markup
    manpower_markup_base_percent = 0.012
    @order.people * manpower_markup_base_percent
  end

  def calculate_total_price
    @base_markup * (1 + @product_markup_percent + @manpower_markup_percent)
  end

  def formatted_total_price
    @total_price.to_s.prepend('$')
  end

end
