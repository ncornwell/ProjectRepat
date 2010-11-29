# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateRightsRoles < ActiveRecord::Migration
  def self.up
    create_table :rights_roles, :id => false, :force => true do |t|
      t.integer :right_id, :limit => 11
      t.integer :role_id,  :limit => 11
    end
  end

  def self.down
    drop_table :rights_roles
  end
end
