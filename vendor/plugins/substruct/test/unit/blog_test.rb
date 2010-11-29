# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class BlogTest < ActiveSupport::TestCase
  fixtures :content_nodes


  # Find latest blog post.
  def test_should_find_latest
    assert_equal content_nodes(:silent_birth), Blog.find_latest
  end


end
