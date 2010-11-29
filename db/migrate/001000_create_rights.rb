# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateRights < ActiveRecord::Migration
  def self.up
    create_table :rights, :force => true do |t|
      t.string :name
      t.string :controller
      t.string :actions
    end
  end

  def self.down
    drop_table :rights
  end
end
