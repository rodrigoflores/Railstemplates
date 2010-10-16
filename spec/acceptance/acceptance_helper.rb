require File.dirname(__FILE__) + "/../spec_helper"
require "steak"
require 'capybara/rails'

RSpec.configuration.include Capybara, :type => :acceptance

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

# DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:each, :type => :acceptance) do
   # Capybara.reset_sessions! 
    DatabaseCleaner.strategy = :truncation

    DatabaseCleaner.clean
  end

  # config.before(:each) do
  #   Capybara.current_driver = :selenium if example.metadata[:js]
  # end
  # 
  # config.after(:each) do
  #   Capybara.use_default_driver if example.metadata[:js]
  # end  

end
