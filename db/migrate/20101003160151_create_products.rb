class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :id
      t.string :name
      t.string :title
      t.text :content
      t.float :price
      t.string :location
      t.timestamps
    end

    create_table :inventory do |t|
      t.integer :productid
      t.integer :quantity
      t.string  :size
      t.timestamps
    end

    create_table :product_images do |t|
      t.integer :productid
      t.string  :imagename
      
    end

    
  end

  def self.down
    drop_table :products
    drop_table :inventory
    drop_table :product_images
  end
end
