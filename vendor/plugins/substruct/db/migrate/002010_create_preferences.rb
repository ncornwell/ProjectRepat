# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreatePreferences < ActiveRecord::Migration
  def self.up
  create_table :preferences, :force => true do |t|
    t.string :name,  :default => '', :null => false
    t.string :value, :default => ''
  end

  add_index :preferences, [:name], :name => "preference_name"
  end

  def self.down
    drop_table :preferences
  end
end
