# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateOrderStatusCodes < ActiveRecord::Migration
  def self.up
    create_table :order_status_codes, :force => true do |t|
      t.string :name, :limit => 30, :default => '', :null => false
    end
  
    add_index :order_status_codes, [:name], :name => "status_code_name"
  end

  def self.down
    drop_table :order_status_codes
  end
end
