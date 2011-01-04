source 'http://rubygems.org'

gem 'rails', '3.0.3' 

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'

# Bundle gems for certain environments:
# gem 'rspec', :group => :test
# group :test do
#   gem 'webrat'
# end


## Substruct Gems ##

  gem 'tlsmail'
  gem 'activemerchant', :require=>'active_merchant', :git=>"http://github.com/Shopify/active_merchant.git"
  gem 'acts_as_tree'
  gem 'ezcrypto'
  # gem 'fastercsv' unless (RUBY_VERSION.to_f >= 1.9)
  # gem 'paperclip'
  gem 'paperclip', :git=>'http://github.com/rubyjedi/paperclip.git'
  gem 'RedCloth'
  gem 'will_paginate', :git=>"http://github.com/mislav/will_paginate.git", :branch=>"rails3"
  gem 'aws-s3'
  
  group(:test) do
    gem 'rcov'
    gem 'mocha'
  end


  group(:development) do
    gem 'sqlite3'
  end