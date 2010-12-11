# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
# Represents any type of user upload that's not an image.
#
class Asset < UserUpload
  
  MAX_SIZE = 10.megabyte

  has_attached_file :upload, 
	:storage => :s3,
	:s3_credentials => {
	:access_key_id => ENV['S3_KEY'],
	:secret_access_key => ENV['S3_SECRET']
	},
	:bucket => ENV['S3_BUCKET'],
	:path => ":attachment/:id/:style.:extension" # TODO: Set :url and :path
  attr_protected :upload_file_name, :upload_content_type, :upload_size  
  validates_attachment_size :upload, :less_than=>MAX_SIZE
end
