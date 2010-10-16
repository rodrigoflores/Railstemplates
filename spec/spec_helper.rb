ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'remarkable/active_record'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  Devise::Oauth.test_mode!
  
  #config.include Devise::TestHelpers, :type => :controller
  config.mock_with :rspec

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true
end
