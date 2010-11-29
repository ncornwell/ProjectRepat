class CreateAffiliatePayments < ActiveRecord::Migration
  def self.up
    # AffiliatePayment - keeps track of payments made to Affiliates
		create_table :affiliate_payments do |t|
		  t.string   :number, :string
		  t.datetime :created_at, :datetime
		  t.integer  :affiliate_id, :integer, :default => 0, :null => false
		  t.float    :amount, :float, :default => 0.0, :null => false
		  t.text     :notes, :text
		end
  end

  def self.down
		drop_table :affiliate_payments
  end
end