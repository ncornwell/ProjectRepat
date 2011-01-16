# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class PaypalController < ApplicationController
  include ActiveMerchant::Billing::Integrations

  protect_from_forgery :except => :ipn
  skip_before_filter :verify_authenticity_token
  # Handles Instant Payment Notification
  # from PayPal after a purchase.
  def ipn
    notification = Paypal::Notification.new(request.raw_post)

    begin
      if notification.acknowledge
        begin
          order = Order.find_by_order_number(
            notification.invoice,
            :include => :shipping_address
          )
          if notification.complete? && order.matches_ipn?(notification, params)
            order.pass_ipn(params[:txn_id])
          else
            order.fail_ipn()
          end
        ensure
          order.save
        end
      end
    ensure
      render :nothing => true
    end
  end
end
