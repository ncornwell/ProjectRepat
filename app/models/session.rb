# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class Session < ActiveRecord::Base
  SESSION_TIMEOUT = 4.hours
end
