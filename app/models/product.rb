class Product < ActiveRecord::Base
  has_many :product_images, :dependent => :destroy
  belongs_to :location
  belongs_to :category
end
