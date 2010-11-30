# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries, :force => true do |t|
      t.string  :name,        :limit => 100, :default => "",    :null => false
      t.string  :code,        :limit => 50
      t.integer :rank,        :limit => 11
      t.integer :is_obsolete,                :default => 0, :null => false
    end
  end

  def self.down
    drop_table :countries
  end
end
