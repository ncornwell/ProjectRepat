# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateOrderUsers < ActiveRecord::Migration
  def self.up
    create_table :order_users, :force => true do |t|
      t.string   :username,      :limit => 50
      t.string   :email_address, :limit => 50, :default => '', :null => false
      t.string   :password,      :limit => 20
      t.datetime :created_on
      t.string   :first_name,    :limit => 50, :default => '', :null => false
      t.string   :last_name,     :limit => 50, :default => '', :null => false
    end
  
    add_index :order_users, [:email_address], :name => "email"
  end

  def self.down
    drop_table :order_users
  end
end
