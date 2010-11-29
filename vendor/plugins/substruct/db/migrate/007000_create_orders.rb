# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders, :force => true do |t|
      t.integer  :order_number,           :limit => 11, :default => 0,   :null => false
      t.datetime :created_on
      t.datetime :shipped_on
      t.integer  :order_user_id,          :limit => 11
      t.integer  :order_status_code_id,   :limit => 11, :default => 1,   :null => false
      t.text     :notes
      t.string   :referer
      t.integer  :order_shipping_type_id, :limit => 11, :default => 1,   :null => false
      t.float    :product_cost,                         :default => 0.0
      t.float    :shipping_cost,                        :default => 0.0
      t.float    :tax,                                  :default => 0.0, :null => false
      t.string   :auth_transaction_id
      t.integer  :promotion_id,           :limit => 11, :default => 0,   :null => false
      t.integer  :shipping_address_id,    :limit => 11, :default => 0,   :null => false
      t.integer  :billing_address_id,     :limit => 11, :default => 0,   :null => false
      t.integer  :order_account_id,       :limit => 11, :default => 0,   :null => false
      
      t.integer  :affiliate_id,           :limit => 11, :default => 0,   :null => false      
      t.integer  :affiliate_payment_id,   :limit => 11, :default => 0,   :null => false
    end
  
    add_index :orders, [:order_number], :name => "order_number"
    add_index :orders, [:order_user_id], :name => "order_user_id"
    add_index :orders, [:order_status_code_id], name => "status"
  end

  def self.down
    drop_table :orders
  end
end
