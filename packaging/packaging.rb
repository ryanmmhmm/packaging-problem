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

end
