# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class OrderAddress < ActiveRecord::Base
  # Association
  has_one :order
  belongs_to :order_user
  belongs_to :country
  # Validation
  validates_with OrderAddressValidator
  
  validates_presence_of :order_user_id, :country_id
  validates_presence_of :zip, :message => "#{ERROR_EMPTY} If you live in a country that doesn't have postal codes please enter '00000'."
  validates_presence_of :telephone, :message => ERROR_EMPTY
  validates_presence_of :first_name, :message => ERROR_EMPTY
  validates_presence_of :last_name, :message => ERROR_EMPTY
  validates_presence_of :address, :message => ERROR_EMPTY
  # Require city / state if USA
  validates_presence_of :city, :state,
      :if => Proc.new { |oa| oa.country && oa.country.name == 'United States of America' }

  validates_length_of :first_name, :maximum => 50
  validates_length_of :last_name, :maximum => 50
  validates_length_of :address, :maximum => 255



  # Finds the shipping address for a given OrderUser
  def self.find_shipping_address_for_user(user)
    find(:first,
    :conditions => ["#{connection.quote_column_name("order_user_id")} = ? AND #{connection.quote_column_name("is_shipping")} = 1", user.id])
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
end

