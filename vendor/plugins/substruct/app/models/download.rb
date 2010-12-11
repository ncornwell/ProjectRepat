# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
# Represents a downloadable file linked to a product.
# Added as a subclass of 'UserUpload' because we already
# have support for uploading / managing files.
#
# Customers may purchase digital downloads (photos, mp3s, whatever)
# and will receive a download link upon finishing their order. 
#
# They will also get this link in their email receipt generated
# by the system.
#
class Download < UserUpload
  has_many :product_downloads, :dependent => :destroy
  has_one :product, :through => :product_downloads
  
  MAX_SIZE = 20.megabyte
  
  has_attached_file :upload , 
	:storage => :s3,
	:s3_credentials => {
	:access_key_id => ENV['S3_KEY'],
	:secret_access_key => ENV['S3_SECRET']
	},
	:bucket => ENV['S3_BUCKET'],
	:path => ":attachment/:id/:style.:extension"# TODO: Set :url and :path
  attr_protected :upload_file_name, :upload_content_type, :upload_size  
  validates_attachment_size :upload, :less_than=>MAX_SIZE
end
