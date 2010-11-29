# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateWishlistItems < ActiveRecord::Migration
  def self.up
    create_table :wishlist_items, :force => true do |t|
      t.integer  :order_user_id, :limit => 11, :default => 0, :null => false
      t.integer  :item_id,       :limit => 11, :default => 0, :null => false
      t.datetime :created_on
    end
  
    add_index :wishlist_items, [:order_user_id], :name => "user"
    add_index :wishlist_items, [:item_id], :name => "item"
  end

  def self.down
    drop_table :wishlist_items
  end
end
