class HomeController < ApplicationController
  def index
    @products = Products.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end

  end

  def about

  end

end
