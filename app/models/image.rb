# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
# Represents an image
#
class Image < UserUpload

  has_many :product_images, :dependent => :destroy
  has_many :products, :through => :product_images
  
  MAX_SIZE = 10.megabyte

  has_attached_file :upload, :styles => { :thumb => '75x75>', :small => '200x200' }, 
	:storage => :s3,
	:s3_credentials => {
	:access_key_id => ENV['S3_KEY'],
	:secret_access_key => ENV['S3_SECRET']
	},
	:bucket => ENV['S3_BUCKET'],
	:path => ":attachment/:id/:style.:extension"
	# TODO: Set :url and :path
  attr_protected :upload_file_name, :upload_content_type, :upload_size  
  validates_attachment_size :upload, :less_than=>MAX_SIZE
  validates_attachment_content_type :upload, :content_type => [ "image/jpeg", "image/pjpeg", "image/png", "image/x-png", "image/gif" ], :message => 'file must be an image content-type'
end
