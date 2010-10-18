class CreatePaypals < ActiveRecord::Migration
  def self.up
    create_table :paypals do |t|
      t.string :login
      t.string :password
      t.string :signature

      t.timestamps
    end
  end

  def self.down
    drop_table :paypals
  end
end
