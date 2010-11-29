class CreateAffiliates < ActiveRecord::Migration
  def self.up
		# Adds a table for affiliates
		create_table :affiliates do |t|
		  # Affiliate code is generated randomly and given to the affiliate
		  #
		  # This affiliate will give out the code, which people can enter while shopping.
		  #
		  t.string :code, :limit => 15, :default => "", :null => false
      t.string :first_name, :limit => 50, :default => "", :null => false
      t.string :last_name, :limit => 50, :default => "", :null => false
      t.string :telephone, :limit => 20
      t.string :address, :default => "", :null => false
      t.string :city, :limit => 50
      t.string :state, :limit => 10
      t.string :zip, :limit => 10
      t.string :email_address, :limit => 50, :default => "", :null => false
      
      t.string :tax_id, :limit => 20
      t.string :company, :limit => 50
      
      t.boolean  :is_enabled, :default => false
      t.datetime :created_at    
    end
  end

  def self.down
		drop_table :affiliates
  end
end