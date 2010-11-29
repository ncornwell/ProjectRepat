# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class OrdersMailer < ActionMailer::Base
  helper :application

  def inquiry(addy_from, email_text)
    setup_defaults()
    @subject  = "Inquiry from the site"
    @addy_from = addy_from
    @email_text = email_text
    @recipients = Preference.get_value('mail_copy_to').split(',')
    @from = addy_from
  end

  def receipt(order, email_text)
    @subject = "Thank you for your order! (\##{order.order_number})"
    @order = order
    @email_text = email_text
    @recipients = order.order_user.email_address
    setup_defaults
  end

  def reset_password(customer)
    @subject = "Password reset for #{Preference.get_value('store_name')}"
    @customer = customer
    @recipients = customer.email_address
    setup_defaults
  end

  def failed(order)
    @subject = "An order has failed on the site"
    @order = order
    @recipients = Preference.get_value('mail_copy_to').split(',')
    setup_defaults    
  end
  
  def testing array_to
    @subject = "Test from #{Preference.get_value('store_name')}"
    @recipients = array_to
    setup_defaults
    # we get here
  end
  
  private
  def setup_defaults
  
    Preference.get_value('mail_username')
    @bcc        = Preference.get_value('mail_copy_to').split(',')
    @from       = Preference.get_value('mail_username')
    @sent_on    = Time.now
    @headers    = {}
  end
  
end
