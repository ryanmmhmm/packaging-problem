class Quote
  attr_accessor :cost, :people, :product_type

  def initialize(cost, people, product_type)
    @cost = cost
    @people = people
    @product_type = product_type
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
      input.lstrip!
      input.tr!('a-z','')
    end

    return input
  end

  def format_people
    self.people = remove_letters(self.people)
    self.people = self.people.to_i
  end

  def format_product_type
    self.product_type.lstrip!
    self.product_type.downcase!
    return self.product_type
  end

end
