# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class CountryTest < ActiveSupport::TestCase
  fixtures :countries


  def test_number_of_orders
    a_country = countries(:BR)
    assert_equal a_country.number_of_orders, 0
  end


end
