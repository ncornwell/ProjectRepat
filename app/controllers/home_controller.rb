class HomeController < ApplicationController
  def index
    @products = Products.all.take(9)
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end

  end

  def about
  end

  def history
  end
end
