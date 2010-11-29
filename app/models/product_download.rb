# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
# Represents a connection from a download to a product.
class ProductDownload < ActiveRecord::Base
  belongs_to :product
  belongs_to :download
end
