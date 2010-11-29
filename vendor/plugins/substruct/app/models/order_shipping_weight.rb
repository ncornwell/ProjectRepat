# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
# These are the "variations" of an OrderShippingType
#
# They allow an admin to specify weight ranges and prices
# for an OrderShippingType.
#
#
class OrderShippingWeight < ActiveRecord::Base
  belongs_to :order_shipping_type
  validates_presence_of :price
  validates_numericality_of :price
end
