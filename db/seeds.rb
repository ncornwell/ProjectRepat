# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   cities = City.create([{ :name => 'Chicago' , :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

location = Location.create({:id => 1, :name => "Tanzania, Africa"})
category = Category.create({:id => 1, :name => "Shirts"})

   
(1...10).each {|x|
  product = Product.create({:name => "tshirt #{x}",
      :id => x,
      :title => "This is tshirt #{x}",
      :content => "T shirt #{x} was found in tanzania ant some market",
      :price => 30.00,
      :sex => "male"})
  product.location = location
  product.category = category
  product.save

  pimage = ProductImage.create({:imagename => 'rails.jpg'})
  pimage.product = product
  pimage.save
}