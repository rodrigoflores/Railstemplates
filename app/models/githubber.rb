class Githubber < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :oauthable
  devise :database_authenticatable, :trackable, :oauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :github_token
end
