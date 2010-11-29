# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateRelatedProducts < ActiveRecord::Migration
  def self.up
    create_table :related_products, :id => false, :force => true do |t|
      t.integer :product_id, :limit => 11, :default => 0, :null => false
      t.integer :related_id, :limit => 11, :default => 0, :null => false
    end
    add_index :related_products, [:product_id, :related_id], :name => "related_products_idx"
  end

  def self.down
    drop_table :related_products
  end
end
