ACCESS_TOKEN = {
    :access_token => "railstemplates"
  }

  GITHUB_INFO = {
    :user => {
      :name  => 'Tyler Durden',
      :email => 'tyler@soapfactory.com',
      :login => 'tyler'
    }
  }

module OauthHelpers
  def self.included(base)
    base.class_eval do

      def stub_oauth!
        Devise::Oauth.short_circuit_authorizers!

        Devise::Oauth.stub!(:github) do |client|
          client.post('/login/oauth/access_token') { [200, {}, ACCESS_TOKEN.to_json] }
          client.get('/api/v2/json/user/show?access_token=railstemplates') { [200, {}, GITHUB_INFO.to_json] }
        end
      end
    end
  end
end

RSpec.configuration.include OauthHelpers, :type => :acceptance
