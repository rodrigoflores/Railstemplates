require 'spec_helper'

describe Template do
  it { should have_many :likes }
  it { should validate_presence_of :title, :gist_file }

  describe "content" do
    before do
      gist = mock
      gist.stub!(:body).and_return("GIST CONTENT")
      HTTParty.stub!(:get).with("http://gist.github.com/raw/1337/template.rb").and_return(gist)

      repo = mock
      repo.stub!(:body).and_return("REPO CONTENT")
      HTTParty.stub!(:get).with("http://github.com/sabbre/base-template/raw/master/template.rb").and_return(repo)
    end

    it "fetches the content from a given gist" do
      Template.new(:gist_file => "http://gist.github.com/raw/1337/template.rb").content.should == "GIST CONTENT"
    end

    it "fetches the content from a file" do
      Template.new(:gist_file => "http://github.com/sabbre/base-template/raw/master/template.rb").content.should == "REPO CONTENT"
    end
  end

end

# == Schema Information
#
# Table name: templates
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  description  :string(255)
#  gist_file    :string(255)
#  githubber_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

