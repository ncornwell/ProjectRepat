# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateOrderShippingTypes < ActiveRecord::Migration
  def self.up
    create_table :order_shipping_types, :force => true do |t|
      t.string  :name,        :limit => 100, :default => '',   :null => false
      t.string  :code,        :limit => 50
      t.boolean :is_domestic,                :default => true, :null => false
      t.float   :price,                      :default => 0.0,  :null => false
    end
  end

  def self.down
    drop_table :order_shipping_types
  end
end
