require 'spec_helper'

describe Github do
  context "from a gist" do
    it "validates the gist url" do
      Github.new("http://gist.github.com/448487").should be_gist
    end
  end

  context "from a github file" do
    it "validates the file url" do
      Github.new("http://github.com/sabbre/base-template/blob/master/template.rb").should be_repo
    end
  end

  it "invalid everything else" do
    google = Github.new("http://google.com")
    google.should_not be_repo
    google.should_not be_gist

    google.should be_invalid
  end
  
  describe "raw" do
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