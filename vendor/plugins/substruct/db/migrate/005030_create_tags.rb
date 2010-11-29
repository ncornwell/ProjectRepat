# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags, :force => true do |t|
      t.string  :name,      :limit => 100, :default => '', :null => false
      t.integer :rank,      :limit => 11
      t.integer :parent_id, :limit => 11,  :default => 0,  :null => false
    end
    add_index :tags, [:name], :name => "tag_name"
  end

  def self.down
    drop_table :tags
  end
end
