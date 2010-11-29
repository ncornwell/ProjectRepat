# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
# Items that make up a customer's wishlist.
#
class WishlistItem < ActiveRecord::Base
  belongs_to :order_user
  belongs_to :item
  
end
