# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.string :login,    :limit => 50, :default => '', :null => false
      t.string :password, :limit => 40
    end
    add_index :users, [:login, :password], :name => "login"
  end

  def self.down
    drop_table :users
  end
end
