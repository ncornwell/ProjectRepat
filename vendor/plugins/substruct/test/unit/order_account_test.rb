# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class OrderAccountTest < ActiveSupport::TestCase
  fixtures :order_accounts, :order_users


  # Test if a valid account can be created with success.
  def test_create_account
    an_account = OrderAccount.new
    
    an_account.order_user = order_users(:mustard)
    an_account.cc_number = "|
    LzmzOb/JS+mFF72xts17cg==
"
    an_account.routing_number = ""
    an_account.bank_name = ""
    an_account.expiration_year = 4.years.from_now.year
    an_account.expiration_month = 1
    an_account.credit_ccv = ""
    an_account.account_number = ""

    assert an_account.save
  end


  # Test if an account can be found with success.
  def test_find_account
    an_account_id = order_accounts(:santa_account).id
    assert_nothing_raised {
      OrderAccount.find(an_account_id)
    }
  end


  # Test if an account can be updated with success.
  def test_update_account
    an_account = order_accounts(:santa_account)
    assert an_account.update_attributes(:expiration_month => 2)
  end


  # Test if an account can be destroyed with success.
  def test_destroy_account
    an_account = order_accounts(:santa_account)
    an_account.destroy
    assert_raise(ActiveRecord::RecordNotFound) {
      OrderAccount.find(an_account.id)
    }
  end

  

  # Test if an invalid account really will NOT be created.
  def test_validation_expiration_dates
    an_account = OrderAccount.new
    #an_account.cc_number = '1234567890'
    
    # An order account must have valid expiration month and year.
    assert !an_account.valid?
    assert an_account.errors[:expiration_month].any?, "Should have an error in expiration_month"
    assert an_account.errors[:expiration_year].any?, "Should have an error in expiration_year"
    
    assert_same_elements ["is not a number", "Please enter a valid expiration date."], an_account.errors[:expiration_month]
    assert "is not a number", an_account.errors[:expiration_year].any? ## FIXME: Why are validations pushing DUPLICATE messages into errors[] ?

    an_account.expiration_month = 1.month.ago.month
    an_account.expiration_year = 1.year.ago.year
    
    an_account.errors.clear
    assert !an_account.valid?
    
    assert an_account.errors[:expiration_month].any?, "Should have an error in expiration_month"
    assert "Please enter a valid expiration date.", an_account.errors[:expiration_month].any? ## FIXME: Why are validations pushing DUPLICATE messages into errors[] ?
  end

  def test_validation_cc_number
    an_account = OrderAccount.new
        
    an_account.order_account_type_id = OrderAccount::TYPES['Credit Card']
    assert !an_account.valid?
    assert an_account.errors[:cc_number].any?
 
    # An account of type "Credit Card" must have a cc_number.
    assert ERROR_EMPTY, an_account.errors[:cc_number].any? ## FIXME: Why are validations pushing DUPLICATE messages into errors[] ?
end
 
 def test_validation_routing_account_number
    an_account = OrderAccount.new
       
    an_account.order_account_type_id = OrderAccount::TYPES['Checking']
    assert !an_account.valid?
    assert an_account.errors[:routing_number].any?
    assert an_account.errors[:account_number].any?
 
    # An account of type "Checking" must have a routing_number and an account_number.
    assert ERROR_EMPTY, an_account.errors[:routing_number].any? ## FIXME: Why are validations pushing DUPLICATE messages into errors[] ?
    assert ERROR_EMPTY, an_account.errors[:account_number].any? ## FIXME: Why are validations pushing DUPLICATE messages into errors[] ?

    assert !an_account.save
  end


  # TODO: Should this really be here? It seems like a helper method and very easy to generate.
  # Test if a shipping address can be found for an user.
  def test_return_months_and_years
    assert_equal OrderAccount.months, (1..12).to_a
    assert_equal OrderAccount.years, (Date.today.year..9.years.from_now.year).to_a
  end


  # Test if the credit card number will be croped.
  def test_clear_personal_information
    an_account = OrderAccount.new
    
    an_account.order_user = order_users(:mustard)
    an_account.cc_number = "4007000000027"
    an_account.routing_number = ""
    an_account.bank_name = ""
    an_account.expiration_year = 4.years.from_now.year
    an_account.expiration_month = 1
    an_account.credit_ccv = ""
    an_account.account_number = ""

    assert an_account.save
    
    an_account.clear_personal_information
    assert_equal an_account.cc_number, "XXXXXXXXX0027"
  end


  # Test if the credit card number will be crypted/decrypted.
  def test_crypt_decrypt_information
    an_account = OrderAccount.new
    
    an_account.order_user = order_users(:mustard)
    an_account.routing_number = ""
    an_account.bank_name = ""
    an_account.expiration_year = 4.years.from_now.year
    an_account.expiration_month = 1
    an_account.credit_ccv = ""
    
    # These attributes are encrypted. 
    an_account.cc_number = "4007000000027"
    an_account.account_number = "123456789"

    assert an_account.save
    
    an_account.reload
    assert_equal an_account.cc_number, "4007000000027"
    assert_equal an_account.account_number, "123456789"
  end

end
