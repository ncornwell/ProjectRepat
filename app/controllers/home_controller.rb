class HomeController < ApplicationController

  # Control for static pages (in case I want to make them dynamic
  respond_to :xml, :html, :json

  def about
  end

  def history
  end

end
