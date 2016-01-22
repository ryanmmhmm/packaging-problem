require './test_helper'
require 'packaging.rb'

class TestPackaging < MiniTest::Test

  def setup
    @unformatted_input1 = { cost: "$1299.99", people: "3 people", product_type: "FooD" }
    @input1 = Quote.new(@unformatted_input1)
    @output1 = Price.new(@input1)

    @unformatted_input2 = { cost: "$5432.00", people: "1  PERson", product_type: "DRUGS" }
    @input2 = Quote.new(@unformatted_input2)
    @output2 = Price.new(@input2)

    @unformatted_input3 = { cost: "$12456.95", people: "4 people", product_type: "Bo oks" }
    @input3 = Quote.new(@unformatted_input3)
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

  def test_that_output_has_proper_product_markup
    assert_equal(0.13, @output1.calculate_product_markup)
  end

  def test_that_drugs_has_proper_product_markup
    assert_equal(0.075, @output2.calculate_product_markup)
  end

  def test_that_books_has_proper_product_markup
    assert_equal(0.00, @output3.calculate_product_markup)
  end

  def test_that_total_price_output_is_correct_for_input1
    assert_equal('$1591.58', @output1.formatted_total_price)
  end

  def test_that_total_price_output_is_correct_for_input2
    assert_equal('$6199.81', @output2.formatted_total_price)
  end

  def test_that_total_price_output_is_correct_for_input3
    assert_equal('$13707.63', @output3.formatted_total_price)
  end

end