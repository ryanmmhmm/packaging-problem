class Quote
  attr_accessor :cost, :people, :product_type
  attr_reader :price

  def initialize(cost, people, product_type, price = Price.new)
    @cost = cost
    @people = people
    @product_type = product_type
    @price = price

    self.format_attributes
  end

  def remove_dollar_sign(input)
    if input[0] == "$"
      input.slice!(0)
    end

    return input
  end

  def format_cost
    if self.cost.is_a?(String)
        self.cost = remove_dollar_sign(self.cost)
    end
    self.cost = self.cost.to_f
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
    self.people = remove_letters(self.people)
    self.people = self.people.to_i
  end

  def format_product_type
    self.product_type.tr!(' ','')
    self.product_type.downcase!
    return self.product_type
  end

  def format_attributes
    self.cost = self.format_cost
    self.people = self.format_people
    self.product_type = self.format_product_type
  end
end


class Price

  attr_reader :base_markup, :manpower_markup

  def initialize
    @base_markup = 0.05
    @manpower_markup = 0.012
  end

end
