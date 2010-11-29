# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateOrderShippingWeights < ActiveRecord::Migration
  def self.up
    create_table :order_shipping_weights, :force => true do |t|
      t.integer :order_shipping_type_id, :limit => 11, :default => 0,   :null => false
      t.float   :min_weight,                           :default => 0.0, :null => false
      t.float   :max_weight,                           :default => 0.0, :null => false
      t.float   :price,                                :default => 0.0, :null => false
    end
  end

  def self.down
    drop_table :order_shipping_weights
  end
end
