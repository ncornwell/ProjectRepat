# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class Question < ActiveRecord::Base
  # Validation
	validates_presence_of :short_question, :message => ERROR_EMPTY
  validates_presence_of :long_question, :message => ERROR_EMPTY
  validates_presence_of :email_address, :message => ERROR_EMPTY
end
