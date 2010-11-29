# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
# Represents a file uploaded by a user.
#
# Subclassed by Image, Asset, and Download
#
# Before a save, checks to set the type, based on file extension.
#
class UserUpload < ActiveRecord::Base
  # Checks what type of file this is based on extension.
  #
  # If it's an image, we treat it differently and save
  # as an image type.
  #
  # No, we're not using anything fancy here, just the extension set.
  #

  # Returns extension
  #
  def extension
    self.upload.original_filename[self.upload.original_filename.rindex('.') + 1, self.upload.original_filename.size]
  end
  
  # Returns file name
  #
  def name
    self.upload.original_filename
  end

  def relative_path
    self.upload.original_filename
  end

  def filename_without_ext
    self.upload.original_filename[0, self.upload.original_filename.rindex('.')]
  end

  # use this to make a new user upload when you don't know whether it should
  # be an image or an asset.  Can't use UserUpload.new since UserUpload doesn't invoke 
  # Paperclip's has_attached_file() - only the descendant classes (Image, Asset, and Download) do.
  def self.init(file_data)
    if file_data.content_type.index('image')
      user_upload = Image.new
    else
      user_upload = Asset.new
    end
    user_upload.upload = file_data
    user_upload
  end

end
