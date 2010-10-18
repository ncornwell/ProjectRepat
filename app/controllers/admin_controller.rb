class AdminController < ApplicationController
  before_filter :only_admin
  
  respond_to :html

  def paypal
    
    if Paypal.all.length > 0
      @paypal = Paypal.all.first
    else
      @paypal = Paypal.new
      @paypal.save
    end
    
    if params[:paypal]
      @paypal.update_attributes(params[:paypal])
    end

    respond_with(@paypal)
    
  end

end