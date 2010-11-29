# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items, :force => true do |t|
      t.string   :code,               :limit => 100,  :default => "",    :null => false
      t.string   :name,               :limit => 100, :default => "",    :null => false
      t.text     :description
      t.float    :price,                             :default => 0.0,   :null => false
      t.datetime :date_available,                                       :null => false
      t.integer  :quantity,           :limit => 11,  :default => 0,     :null => false
      t.float    :size_width,                        :default => 0.0,   :null => false
      t.float    :size_height,                       :default => 0.0,   :null => false
      t.float    :size_depth,                        :default => 0.0,   :null => false
      t.float    :weight,                            :default => 0.0,   :null => false
      t.string   :type,               :limit => 40
      t.integer  :product_id,         :limit => 11,  :default => 0,     :null => false
      t.integer  :is_discontinued,                   :default => false, :null => false
      t.integer  :variation_quantity, :limit => 11,  :default => 0,     :null => false
      t.integer  :variation_rank,     :limit => 3
    end
    add_index "items", ["quantity", "is_discontinued", "variation_quantity"], :name => "published"
    add_index "items", ["product_id", "type"], :name => "variation"
    add_index "items", ["date_available", "is_discontinued", "quantity", "variation_quantity", "type"], :name => "tag_view"
    add_index "items", ["name", "code", "is_discontinued", "date_available", "quantity", "variation_quantity", "type"], :name => "search"
  end

  def self.down
    drop_table :items
  end
end
