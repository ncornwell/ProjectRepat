# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateOrderLineItems < ActiveRecord::Migration
  def self.up
  create_table :order_line_items, :force => true do |t|
    t.integer :item_id,    :limit => 11
    t.integer :order_id,   :limit => 11, :default => 0,   :null => false
    t.integer :quantity,   :limit => 11, :default => 0,   :null => false
    t.float   :unit_price,               :default => 0.0, :null => false
    t.string  :name,                     :default => ''
  end
  end

  def self.down
    drop_table :order_line_items
  end
end
