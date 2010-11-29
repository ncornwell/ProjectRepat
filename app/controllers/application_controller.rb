class ApplicationController < ActionController::Base
  ## Begin Substruct Includes ##
  include SubstructApplicationController  
  before_filter :set_substruct_view_defaults
  before_filter :get_nav_tags
  before_filter :find_customer
  ## End Substruct Includes ##
  
  protect_from_forgery
  layout 'application'
end
