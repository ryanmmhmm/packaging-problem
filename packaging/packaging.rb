class Quote
  attr_accessor :cost, :people, :product_type

  def initialize(cost, people, product_type)
    @cost = cost
    @people = people
    @product_type = product_type

    self.format_attributes
  end

  def remove_dollar_sign(input)
    if input[0] == "$"
      input.slice!(0)
    end

    return input
  end

  def format_cost
    if @cost.is_a?(String)
        @cost = remove_dollar_sign(@cost)
    end
    @cost = @cost.to_f
  end

  def remove_letters(input)
    if input.is_a?(String)
      input.downcase!
      input.tr!(' ','')
      input.tr!('a-z','')
    end

    return input
  end

  def format_people
    @people = remove_letters(@people)
    @people = @people.to_i
  end

  def format_product_type
    @product_type.tr!(' ','')
    @product_type.downcase!
    @product_type
  end

  def format_attributes
    @cost = self.format_cost
    @people = self.format_people
    @product_type = self.format_product_type
  end
end


class Price

  attr_reader :quote, :base_markup, :manpower_markup_percent, :product_markup_percent, :total_price

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
