class AddCommentsAgentsSizeLocation < ActiveRecord::Migration
  def self.up

    create_table :comments do |t|
      t.integer "product_id",  :default => 0, :null => false
      t.text     "body"
      t.timestamps
    end

   
  end

  def self.down

    drop_table :comments

  end
end
