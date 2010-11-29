# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateContentNodes < ActiveRecord::Migration
  def self.up
    create_table :content_nodes, :force => true do |t|
      t.integer  :user_id
      t.string   :name,       :limit => 200, :default => "", :null => false
      t.string   :title,      :limit => 100, :default => "", :null => false
      t.text     :content
      t.datetime :display_on,                                :null => false
      t.datetime :created_on,                                :null => false
      t.string   :type,       :limit => 50,  :default => "", :null => false
    end
    add_index :content_nodes, [:name], :name => "content_node_name"
    add_index :content_nodes, [:type, :id], :name => "content_node_type"
  end

  def self.down
    drop_table :content_nodes
  end
end
