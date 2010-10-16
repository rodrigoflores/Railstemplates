require 'spec_helper'

describe TemplatesController do
  describe "downloading file" do
    before do
      gist = mock
      gist.stub!(:body).and_return("GIST CONTENT")
      HTTParty.stub!(:get).with("http://gist.github.com/raw/666/foo").and_return(gist)
      @template = Factory(:template, :gist_file => "http://gist.github.com/raw/666/foo")
    end

    it "downloads the template content" do
      get :download, :id => @template.to_param
      response.body.sould == gist.body
    end
  end
end