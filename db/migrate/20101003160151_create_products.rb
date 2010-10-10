class CreateProducts < ActiveRecord::Migration
  def self.up

    create_table :products do |t|
      t.integer :id
      t.string :name
      t.string :title
      t.text :content
      t.float :price
      t.string :sex
      t.references :location
      t.references :category
      t.timestamps
    end

    create_table :product_images do |t|
      t.integer :id
      t.references :product
      t.string  :imagename      
    end

    create_table :categories do |t|
      t.integer :id
      t.string :name
    end

    create_table :locations do |t|
      t.integer :id
      t.string :name
    end

  end

  def self.down
    drop_table :products
    drop_table :product_images
    drop_table :categories
    drop_table :locations
  end
end
