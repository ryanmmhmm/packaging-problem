require './test_helper'
require 'packaging.rb'

class TestPackaging < MiniTest::Test

  def setup
    @input1 = Quote.new("$1299.99","3 people","FooD")

    @input2 = Quote.new("$5432.00","1  PERson","DRUGS")

    @input3 = Quote.new("$12456.95"," 4 people","Bo oks")
  end

  def test_that_input1_has_formatted_attr
    assert_equal(1299.99, @input1.cost)
    assert_equal(3, @input1.people)
    assert_equal("food", @input1.product_type)
  end

  def test_that_input2_has_formatted_attr
    assert_equal(5432.00, @input2.cost)
    assert_equal(1, @input2.people)
    assert_equal("drugs", @input2.product_type)
  end

  def test_that_input3_has_formatted_attr
    assert_equal(12456.95, @input3.cost)
    assert_equal(4, @input3.people)
    assert_equal("books", @input3.product_type)
  end

  def test_that_input_has_base_markup_association
    assert_equal(0.05, @input1.price.base_markup)
  end

  def test_that_input_has_manpower_markup_association
    assert_equal(0.012, @input1.price.manpower_markup)
  end

end