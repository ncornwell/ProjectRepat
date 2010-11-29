# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions, :force => true do |t|
      t.string   :code,               :limit => 15, :default => '',  :null => false
      t.integer  :discount_type,      :limit => 11, :default => 0,   :null => false
      t.float    :discount_amount,                  :default => 0.0, :null => false
      t.integer  :item_id,            :limit => 11
      t.datetime :start,                                             :null => false
      t.datetime :end,                                               :null => false
      t.float    :minimum_cart_value
      t.string   :description,                      :default => '',  :null => false
    end
  end

  def self.down
    drop_table :promotions
  end
end
