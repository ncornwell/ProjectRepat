# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class ImageTest < ActiveSupport::TestCase
  fixtures :items, :product_images, :user_uploads


  # Test if a valid image can be created with success.
  def test_should_create_image
    lightsabers_image = substruct_fixture_file("lightsabers.jpg")

    an_image = Image.new
    an_image.upload = lightsabers_image
    assert an_image.save
    
    # We must erase the record and its files by hand, just calling destroy.
    assert an_image.destroy
  end


  # Test if an image can be associated with products.
  def test_should_associate_images
    a_product = items(:lightsaber)
    assert_equal a_product.images.count, 3

    lightsabers_image = substruct_fixture_file("lightsabers.jpg")

    an_image = Image.new
    an_image.upload = lightsabers_image
    assert an_image.save
    
    a_product.images << an_image
    assert_equal a_product.images.count, 4
    
    # We must erase the record and its files by hand, just calling destroy.
    assert an_image.destroy
  end


  # Test if an image will generate and get rid of its files properly.
  def test_should_handle_files
    # make reference to four images.
    lightsabers_upload = substruct_fixture_file("lightsabers.jpg")
    lightsaber_blue_upload = substruct_fixture_file("lightsaber_blue.jpg")
    lightsaber_green_upload = substruct_fixture_file("lightsaber_green.jpg")
    lightsaber_red_upload = substruct_fixture_file("lightsaber_red.jpg")

    # Load them all and save.
    lightsabers_image = Image.new
    lightsabers_image.upload = lightsabers_upload
    assert lightsabers_image.save
    
    lightsaber_blue_image = Image.new
    lightsaber_blue_image.upload = lightsaber_blue_upload
    assert lightsaber_blue_image.save
    
    lightsaber_green_image = Image.new
    lightsaber_green_image.upload = lightsaber_green_upload
    assert lightsaber_green_image.save
    
    lightsaber_red_image = Image.new
    lightsaber_red_image.upload = lightsaber_red_upload
    assert lightsaber_red_image.save
    
    image_files = []
    # Assert that all those files exists.
    assert File.exist?( (image_files << lightsabers_image.upload.path).last )
    for thumb in lightsabers_image.upload.styles.collect{|x| x[1]}
      assert File.exist?( (image_files << thumb.attachment.path).last )
    end
    
    assert File.exist?(lightsaber_blue_image.upload.path)
    for thumb in lightsaber_blue_image.upload.styles.collect{|x| x[1]}
      assert File.exist?( (image_files << thumb.attachment.path).last )
    end

    assert File.exist?(lightsaber_green_image.upload.path)
    for thumb in lightsaber_green_image.upload.styles.collect{|x| x[1]}
      assert File.exist?( (image_files << thumb.attachment.path).last )
    end

    assert File.exist?(lightsaber_red_image.upload.path)
    for thumb in lightsaber_red_image.upload.styles.collect{|x| x[1]}
      assert File.exist?( (image_files << thumb.attachment.path).last )
    end

    # We must erase the records and its files by hand, just calling destroy.
    assert lightsabers_image.destroy
    assert lightsaber_blue_image.destroy
    assert lightsaber_green_image.destroy
    assert lightsaber_red_image.destroy    
    
    # See if the files really were erased. (This test is probably redundant, as file-deletion is handled by Paperclip)
    for image_file in image_files do
      assert !File.exist?(image_file)
    end
  end


end
