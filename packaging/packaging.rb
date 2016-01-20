class Quote
  attr_accessor :cost, :people, :product_type

  def initialize(cost, people, product_type)
    @cost = cost
    @people = people
    @product_type = product_type
  end

end
