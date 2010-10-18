admin = User.create(:email => "smallbeantest@smallbean.com", :password => "smallbean", :password_confirmation => "smallbean")
admin.update_attribute(:admin, true)

location = Location.create({:id => 1, :name => "Tanzania, Africa"})
category = Category.create({:id => 1, :name => "Shirts"})

   
(1...10).each {|x|
  product = Product.create({:name => "tshirt #{x}",
      :id => x,
      :title => "This is tshirt #{x}",
      :content => "T shirt #{x} was found in tanzania ant some market",
      :price => 30.00,
      :sex => "male",
      :size => 'M'})
  product.location = location
  product.category = category
  product.save

  pimage = ProductImage.create({:imagename => 'new image'})
  pimage.product = product
  pimage.save
}