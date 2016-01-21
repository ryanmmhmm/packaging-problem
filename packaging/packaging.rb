class Quote
  attr_accessor :cost, :people, :product_type
  attr_reader :price

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

  attr_reader :quote, :base_markup, :manpower_markup, :product_markup, :total_markup

  def initialize(quote)
    @quote = quote
    @base_markup = 0.05
    @manpower_markup = 0.012
    @product_markup = 0
  end

  def calculate_product_markup(product_type)
    case product_type
    when 'drugs'
      @product_markup = 0.075
    when 'food'
      @product_markup = 0.13
    when 'electronics'
      @product_markup = 0.02
    else
      @product_markup = 0
    end
  end

end
