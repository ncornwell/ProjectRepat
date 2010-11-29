# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions, :force => true do |t|
      t.string   :short_question
      t.text     :long_question
      t.text     :answer
      t.integer  :rank,           :limit => 11
      t.boolean  :featured,                     :default => false, :null => false
      t.integer  :times_viewed,   :limit => 11, :default => 0,     :null => false
      t.datetime :created_on,                                      :null => false
      t.datetime :answered_on
      t.string   :email_address,  :limit => 50
    end
  end

  def self.down
    drop_table :questions
  end
end
