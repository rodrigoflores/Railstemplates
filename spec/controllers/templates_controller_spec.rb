require 'spec_helper'

describe TemplatesController do
  describe "downloading file" do
    before do
      gist = mock
      gist.stub!(:body).and_return("GIST CONTENT")
      HTTParty.stub!(:get).with("http://gist.github.com/raw/666/foo").and_return(gist)
      template = Factory(:template, :source_url => "http://gist.github.com/raw/666/foo", :id => 47)
    end

    it "downloads the template content" do
      get :download, :id => 47
      response.body.should == "GIST CONTENT"
    end

    it "increments the download counter" do
      Template.find(47).download_counter.should == 0
      get :download, :id => 47
      Template.find(47).download_counter.should == 1
    end
  end
end