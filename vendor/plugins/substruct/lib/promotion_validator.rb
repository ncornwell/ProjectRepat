# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class PromotionValidator < ActiveModel::Validator
  # Makes sure if 'buy n get one free' discount type that
  # a product is selected.
  def validate(record)  
    if record.discount_type == 2 && record.item_id.nil?
      record.errors[:item_id] << "Please add an item for the 'Buy [n] get 1 free' promotion"
    end
  end  
end