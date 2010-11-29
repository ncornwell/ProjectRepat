# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
# Load the normal Rails helper. This ensures the environment is loaded.
require File.expand_path(File.dirname(__FILE__) + '/../../../../test/test_helper')

# Load the schema - if migrations have been performed, this will be up to date.
#load(File.dirname(__FILE__) + "/../db/schema.rb")
#Rake::Task['db:test:prepare']

# Set up the fixtures location manually, we don't want to move them to a
# temporary path using Engines::Testing.set_fixture_path.
# This works with unit and functional tests.
ActiveSupport::TestCase.fixture_path = File.dirname(__FILE__) + "/fixtures/"
$LOAD_PATH.unshift(ActiveSupport::TestCase.fixture_path)
# This is needed for integration tests.
ActionController::IntegrationTest.fixture_path = File.dirname(__FILE__) + "/fixtures/"
$LOAD_PATH.unshift(ActionController::IntegrationTest.fixture_path)

# The only drawback to using transactional fixtures is when you actually 
# need to test transactions.  Since your test is bracketed by a transaction,
# any transactions started in your code will be automatically rolled back.
ActiveSupport::TestCase.use_transactional_fixtures = true

# Instantiated fixtures are slow, but give you @david where otherwise you
# would need people(:david).  If you don't want to migrate your existing
# test cases which use the @david style and don't mind the speed hit (each
# instantiated fixtures translates to a database query per test method),
# then set this back to true.
ActiveSupport::TestCase.use_instantiated_fixtures  = false

# We don't want our tests with images messing with "public/system" used in
# development and production, and creating images with ids that only exists in
# the test database or overwriting things.

## FIXME: This was something for Attachment-Fu, may want to replace with a Paperclip Equivalent. 
##Image.options[:path] = "public/test/"

include Substruct::Assertions

### Helper methods for test cases ###

def login_as(user) ## This cannot be called from ActionController::IntegrationTest - only from ActionController::TestCase
  @request.session[:user] = users(user).id
end

def login_as_customer(customer) ## This originally could be called from ActionController::IntegrationTest, but has been adapted
  customer_user = order_users(customer)
  post "/customers/login", :login=>customer_user.email_address, :password=>customer_user.password
end

def substruct_fixture_file(filename, mode='rb')
  File.open(File.expand_path(File.dirname(__FILE__) + "/fixtures/files/#{filename}"), mode)
end

# Unfortunately url_for doesn't work as is inside tests, so, a fix.
#def url_for(options)
#  url = ActionController::UrlRewriter.new(@request, nil)
#  url.rewrite(options)
#end
