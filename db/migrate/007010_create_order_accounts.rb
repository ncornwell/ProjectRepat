# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateOrderAccounts < ActiveRecord::Migration
  def self.up
    create_table :order_accounts, :force => true do |t|
      t.integer :order_user_id,         :limit => 11, :default => 0, :null => false
      t.integer :order_account_type_id, :limit => 11, :default => 1, :null => false
      t.string  :cc_number
      t.string  :account_number
      t.integer :expiration_month,      :limit => 2
      t.integer :expiration_year,       :limit => 4
      t.integer :credit_ccv,            :limit => 5
      t.string  :routing_number,        :limit => 20
      t.string  :bank_name,             :limit => 50
    end
    add_index :order_accounts, [:order_user_id, :order_account_type_id], :name => "ids"
  end

  def self.down
    drop_table :order_accounts
  end
end
