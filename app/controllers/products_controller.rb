class ProductsController < ApplicationController
  before_filter :only_admin, :except => [:show, :index]

  respond_to :html, :xml, :json

  def show
    respond_with(@product = Product.find(params[:id]))
  end

  def index
    respond_with(@products = Product.all.take(9))
  end

  def new
    respond_with @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end


    #t.string   "name"
    #t.string   "title"
    #t.text     "content"
    #t.float    "price"
    #t.string   "sex"
    #t.integer  "location_id"
    #t.integer  "category_id"
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
