class Product < ActiveRecord::Base
  has_many :product_images, :dependent => :destroy
  belongs_to :location
  belongs_to :category

  has_attached_file :image,
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"


  #validates_attachment_presence :photo
  #validates_attachment_size :image, :less_than => 1.megabytes
  #validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end