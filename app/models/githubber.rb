class Githubber < ActiveRecord::Base

  devise :database_authenticatable, :trackable, :oauthable

  attr_accessible :name, :email, :password, :github_token
  
  def self.find_for_github_oauth(access_token, signed_in_resource=nil)
    data = ActiveSupport::JSON.decode(access_token.get('/api/v2/json/user/show'))["user"]

    if account = signed_in_resource || Githubber.find_by_email(data["email"])
      account.update_attribute(:github_token, access_token.token)
      account
    else
      Githubber.create!(:name => data["name"], :email => data["email"],
        :password => Devise.friendly_token) { |u| u.github_token = access_token.token }
    end
  end
  
end