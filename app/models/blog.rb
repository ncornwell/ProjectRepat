# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
# A post in the blog
#
class Blog < ContentNode
  #############################################################################
  # CLASS METHODS
  #############################################################################
  def self.find_latest
    find(
      :first,
      :order => "display_on DESC"
    )
  end
  
end
