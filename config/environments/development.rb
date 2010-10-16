Railstemplates::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
  
  Devise.setup do |config|
    config.oauth :github, 'fed31d1e80ac6fc16cea', '224005972731157427bba7ddda6828bbf07ee3be',
     :site => 'https://github.com/',
     :authorize_path => '/login/oauth/authorize',
     :access_token_path => '/login/oauth/access_token',
     :scope => %w(user public_repo)
   end
  
end

