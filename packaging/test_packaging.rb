require './test_helper'
require 'packaging.rb'

class TestPackaging < MiniTest::Test

  def setup
    @input1 = Quote.new("$1299.99","3 people","food")
    @input2 = Quote.new("$5432.00","1 person","drugs")
    @input3 = Quote.new("$12456.95","4 people","books")
  end

  def test_that_input_has_matching_attr
    assert_equal("$1299.99", @input1.cost)
    assert_equal("3 people", @input1.people)
    assert_equal("food", @input1.product_type)
  end

  def test_that_cost_is_string
    assert_kind_of(String, @input1.cost)
  end

  def test_that_cost_has_dollar_sign
    assert_equal("$", @input1.cost[0])
  end

  def test_that_cost_is_float
    assert_equal(1299.99, @input1.format_cost)
  end

end