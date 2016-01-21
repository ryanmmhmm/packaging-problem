require './test_helper'
require 'packaging.rb'

class TestPackaging < MiniTest::Test

  def setup
    @input1 = Quote.new("$1299.99","3 people","FooD")
    @output1 = Price.new(@input1)

    @input2 = Quote.new("$5432.00","1  PERson","DRUGS")
    @output2 = Price.new(@input2)

    @input3 = Quote.new("$12456.95"," 4 people","Bo oks")
    @output3 = Price.new(@input3)
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
    assert_equal(0.05, @output1.base_markup)
  end

  def test_that_input_has_manpower_markup_association
    assert_equal(0.012, @output1.manpower_markup)
  end

  def test_that_food_has_proper_markup
    assert_equal(0.13, @output1.calculate_product_markup(@output1.quote.product_type))
  end

  def test_that_drugs_has_proper_markup
    assert_equal(0.075, @output2.calculate_product_markup(@output2.quote.product_type))
  end

  def test_that_books_has_proper_markup
    assert_equal(0.00, @output3.calculate_product_markup(@output3.quote.product_type))
  end

end