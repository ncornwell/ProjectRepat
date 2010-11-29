# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class UserValidator < ActiveModel::Validator
  def validate(record)  
    if (record.new_record? || (!record.password.blank? && !record.password_confirmation.blank?))  
      if (5 > record.password.length || 40 < record.password.length)
        record.errors.add(:password, " must be between 5 and 40 characters.")
      end
    end
    
    # check presence of password & matching if they both aren't blank
    if (record.password != record.password_confirmation) then
      record.errors.add(:password, " and confirmation don't match.")
    end
  end  
end