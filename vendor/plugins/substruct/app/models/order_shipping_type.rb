# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class OrderShippingType < ActiveRecord::Base
  has_many :orders
  has_many :weights,
    :class_name => 'OrderShippingWeight',
    :dependent => :destroy
  
  attr_accessor :calculated_price
  
  #############################################################################
  # CALLBACKS
  #############################################################################
  
  before_save :check_price
  # Handles nil and blank string prices being passed.
  # Sets them to 0.0...
  def check_price
    self.price = self.price.to_f
  end

  #############################################################################
  # CLASS METHODS
  #############################################################################

  def self.get_domestic
    find(
      :all, 
      :conditions => "is_domestic = 1",
      :order => "price ASC"
    )
  end

  def self.get_foreign
    find(
      :all, 
      :conditions => "is_domestic = 0",
      :order => "price ASC"
    )
  end
  
  #############################################################################
  # INSTANCE METHODS
  #############################################################################

  # Calculates shipping price for a shipping type with weight.
  # If no weight found, use the default.
  def calculate_price(weight)
    
    price = self.price
    
    if self.weights.size > 0
      proper_weight = self.weights.find(
        :first,
        :conditions => ["? BETWEEN min_weight AND max_weight", weight]
      )
      price = proper_weight.price if proper_weight
    end
    
    self.calculated_price = price.to_f.round(2) + Preference.get_value('store_handling_fee').to_f
  end
  
  # Sets weight variations from attribute list.
  #
  def weights=(list)
    self.weights.clear
    for variation in list do
      v = OrderShippingWeight.create(variation)
      self.weights << v
    end
  end
end
