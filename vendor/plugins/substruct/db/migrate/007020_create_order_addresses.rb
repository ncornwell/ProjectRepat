# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateOrderAddresses < ActiveRecord::Migration
  def self.up
    create_table :order_addresses, :force => true do |t|
      t.integer :order_user_id, :limit => 11, :default => 0,  :null => false
      t.string  :first_name,    :limit => 50, :default => '', :null => false
      t.string  :last_name,     :limit => 50, :default => '', :null => false
      t.string  :telephone,     :limit => 20
      t.string  :address,                     :default => '', :null => false
      t.string  :city,          :limit => 50
      t.string  :state,         :limit => 30
      t.string  :zip,           :limit => 10
      t.integer :country_id,    :limit => 11, :default => 0,  :null => false
    end
    add_index :order_addresses, [:first_name, :last_name], :name => "order_customer_names_idx"
    add_index :order_addresses, [:country_id, :order_user_id], :name => "order_countries_idx"
  end

  def self.down
    drop_table :order_addresses
  end
end
