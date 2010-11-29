# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class OrderAccountValidator < ActiveModel::Validator
  def validate(record)  
    today = DateTime.now
    if ( record.expiration_month.nil? || record.expiration_year.nil? || (today.month > record.expiration_month && today.year >= record.expiration_year) || (today.year > record.expiration_year) )
      record.errors[:expiration_month] << 'Please enter a valid expiration date.'
    end
  end  
end