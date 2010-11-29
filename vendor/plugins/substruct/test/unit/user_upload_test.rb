# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
require File.expand_path(File.dirname(__FILE__) + '/../test_helper')


class UserUploadTest < ActiveSupport::TestCase
  fixtures :user_uploads

  # TODO: Get rid of this method if it will not be used.
  # Test if some variations of names are being returned.
  def test_should_return_names
    an_user_upload = user_uploads(:lightsaber_blue_upload)

    assert_equal an_user_upload.relative_path, an_user_upload.upload_file_name
    assert_equal an_user_upload.filename_without_ext, File.basename(an_user_upload.upload_file_name, File.extname(an_user_upload.upload_file_name))
  end


  # Test if the right class will be used.
  def test_should_init_the_right_class
    text_asset = substruct_fixture_file('text_asset.txt')
    lightsabers_image = substruct_fixture_file('lightsabers.jpg')

    assert_kind_of Asset, UserUpload.init(text_asset)
    assert_kind_of Image, UserUpload.init(lightsabers_image)
  end
  
  
end
