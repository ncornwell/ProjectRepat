# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateContentNodesSections < ActiveRecord::Migration
  def self.up
    create_table :content_nodes_sections, :id => false, :force => true do |t|
      t.integer :content_node_id, :limit => 11, :default => 0, :null => false
      t.integer :section_id,      :limit => 11, :default => 0, :null => false
    end
    add_index :content_nodes_sections, [:content_node_id, :section_id], :name => "default"
  end

  def self.down
    drop_table :content_nodes_sections
  end
end
