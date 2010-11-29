# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateProductsTags < ActiveRecord::Migration
  def self.up
    create_table :products_tags, :id => false, :force => true do |t|
      t.integer :product_id, :limit => 11, :default => 0, :null => false
      t.integer :tag_id,     :limit => 11, :default => 0, :null => false
    end
  
    add_index :products_tags, [:product_id, :tag_id], :name => "product_tags"
  end

  def self.down
    drop_table :products_tags
  end
end
