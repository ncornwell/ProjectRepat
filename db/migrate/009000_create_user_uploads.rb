# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateUserUploads < ActiveRecord::Migration
  def self.up
    create_table :user_uploads, :force => true do |t|
      t.string   :upload_file_name
      t.string   :upload_content_type
      t.integer  :upload_file_size,         :limit => 11

      t.integer  :parent_id,    :limit => 11
      t.datetime :created_on
      t.string   :type # For STI Polymorph Descendants
    end
  
    add_index :user_uploads, [:created_on, :type], :name => "creation"
  end

  def self.down
    drop_table :user_uploads
  end
end
