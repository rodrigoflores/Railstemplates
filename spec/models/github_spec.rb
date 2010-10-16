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
end