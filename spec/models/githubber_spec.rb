require 'spec_helper'

describe Githubber do
  
  describe 'associations' do
    it { should have_many :likes }
    it { should have_many :templates }
    it { should have_many :thumbs }
    it { should have_many :commentaries }
  end
  
  describe "liked?" do
    let(:githubber) { Factory(:githubber) }
    let(:template) { Factory(:template) }
    
    it "verifies if the githubber had liked the template" do
      githubber.liked?(template).should be_false
      githubber.like_it(template)
      githubber.liked?(template).should be_true
    end
  end

  describe "unlike_it" do
    let(:githubber) { Factory(:githubber) }
    let(:template) { Factory(:template) }

    it "destroys the like" do
      githubber.like_it(template)
      githubber.unlike_it(template)
      githubber.liked?(template).should be_false
    end
  end

  describe "voted?" do
    let(:githubber) { Factory(:githubber) }
    let(:template) { Factory(:template) }

    it "verifies if the githubber had voted the template" do
      githubber.voted?(template).should be_false
      githubber.vote(template, true)
      githubber.voted?(template).should be_true
    end
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

