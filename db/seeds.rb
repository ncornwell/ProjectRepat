# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   cities = City.create([{ :name => 'Chicago' , :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
products = Products.create([{:name => 'tshirt1', :id => 1,:title => 'This is tshirt1', :content => "T shirt 1 was found in tanzania ant some market",:price => 30.00,:location => 'Tanzania, Africa'},
{:name => 'tshirt2',:id => 2,:title => 'This is tshirt2', :content => "T shirt 1 was found in tanzania ant some market",:price => 30.00,:location => 'Tanzania, Africa'},
{:name => 'tshirt3',:id => 3,:title => 'This is tshirt3', :content => "T shirt 1 was found in tanzania ant some market",:price => 30.00,:location => 'Tanzania, Africa'},
{:name => 'tshirt4',:id => 4,:title => 'This is tshirt4', :content => "T shirt 1 was found in tanzania ant some market",:price => 30.00,:location => 'Tanzania, Africa'},
{:name => 'tshirt5',:id => 5,:title => 'This is tshirt5', :content => "T shirt 1 was found in tanzania ant some market",:price => 30.00,:location => 'Tanzania, Africa'},
{:name => 'tshirt6',:id => 6,:title => 'This is tshirt6', :content => "T shirt 1 was found in tanzania ant some market",:price => 30.00,:location => 'Tanzania, Africa'},
{:name => 'tshirt7',:id => 7,:title => 'This is tshirt7', :content => "T shirt 1 was found in tanzania ant some market",:price => 30.00,:location => 'Tanzania, Africa'},
{:name => 'tshirt8',:id => 8,:title => 'This is tshirt8', :content => "T shirt 1 was found in tanzania ant some market",:price => 30.00,:location => 'Tanzania, Africa'},
{:name => 'tshirt9',:id => 9,:title => 'This is tshirt9', :content => "T shirt 1 was found in tanzania ant some market",:price => 30.00,:location => 'Tanzania, Africa'},
{:name => 'tshirt10',:id => 10,:title => 'This is tshirt10', :content => "T shirt 1 was found in tanzania ant some market",:price => 30.00,:location => 'Tanzania, Africa'}])

#inventories = Inventory.create([{:productid => 1,:quantity => 2,:size => 'M'},
#{:productid => 2,:quantity => 2,:size => 'M'},
#{:productid => 3,:quantity => 2,:size => 'M'},
#{:productid => 4,:quantity => 2,:size => 'M'},
#{:productid => 5,:quantity => 2,:size => 'M'},
#{:productid => 6,:quantity => 2,:size => 'M'},
#{:productid => 7,:quantity => 2,:size => 'M'},
#{:productid => 8,:quantity => 2,:size => 'M'},
#{:productid => 9,:quantity => 2,:size => 'M'},
#{:productid => 10,:quantity => 2,:size => 'M'}])

pimages = ProductImages.create([{:productid => 1,:imagename => 'rails.jpg'},
{:productid => 2,:imagename => 'rails.jpg'},
{:productid => 3,:imagename => 'rails.jpg'},
{:productid => 4,:imagename => 'rails.jpg'},
{:productid => 5,:imagename => 'rails.jpg'},
{:productid => 6,:imagename => 'rails.jpg'},
{:productid => 7,:imagename => 'rails.jpg'},
{:productid => 8,:imagename => 'rails.jpg'},
{:productid => 9,:imagename => 'rails.jpg'},
{:productid => 10,:imagename => 'rails.jpg'}])

