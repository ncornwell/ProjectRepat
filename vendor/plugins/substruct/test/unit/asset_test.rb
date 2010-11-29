# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class AssetTest < ActiveSupport::TestCase


  # Test if an asset will be created, generate and get rid of its files properly and
  # be erased.
  def test_should_create_handle_and_destroy_assets
    text_asset = substruct_fixture_file("text_asset.txt")

    an_asset = Asset.new
    an_asset.upload = text_asset
    assert an_asset.save
    
    # Assert that the file exists.
    asset_file_path = an_asset.upload.path
    assert File.exist?(asset_file_path)

    # We must erase the record and its files by hand, just calling destroy.
    assert an_asset.destroy
    assert !File.exist?(asset_file_path)
  end


end
