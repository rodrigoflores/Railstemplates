class Githubber < ActiveRecord::Base
  has_many :templates
  has_many :likes, :dependent => :delete_all
  has_many :commentaries, :dependent => :delete_all
  has_many :thumbs, :dependent => :delete_all
  devise :database_authenticatable, :trackable, :oauthable

  attr_accessible :name, :email, :login, :password, :github_token
  
  def self.find_for_github_oauth(access_token, signed_in_resource=nil)
    data = ActiveSupport::JSON.decode(access_token.get('/api/v2/json/user/show'))["user"]

    if account = signed_in_resource || Githubber.find_by_email(data["email"])
      account.update_attributes(:github_token => access_token.token, :name => data["name"], 
        :email => data["email"])
      account
    else
      Githubber.create!(:name => data["name"], :email => data["email"], :login => data["login"],
        :password => Devise.friendly_token) { |u| u.github_token = access_token.token }
    end
  end
  
  def like_it(template)
    likes.create(:template => template)
  end
  
  def unlike_it(template)
    like = likes.first(:conditions => { :template_id => template.id })
    like.destroy if like
  end
  
  def vote(template, working)
    current_vote = thumbs.first(:conditions => { :template_id => template.id })
    if current_vote
      current_vote.update_attributes(:up => working)
    else
      thumbs.create(:template => template, :up => working)
    end
  end
  
  def liked?(template)
    !!likes.find_by_template_id(template.id)
  end

  def voted?(template)
    !!thumbs.find_by_template_id(template.id)
  end
end


# == Schema Information
#
# Table name: githubbers
#
#  id                 :integer(4)      not null, primary key
#  email              :string(255)     default("")
#  encrypted_password :string(128)     default(""), not null
#  name               :string(255)
#  github_token       :string(255)
#  sign_in_count      :integer(4)      default(0)
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string(255)
#  last_sign_in_ip    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  login              :string(255)
#

