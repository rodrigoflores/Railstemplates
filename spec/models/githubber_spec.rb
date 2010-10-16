require 'spec_helper'

describe Githubber do

  context "Listing gists" do
    before do
      Gist.stub!(:find).with("newbie").and_return([])
      Gist.stub!(:find).with("coder").and_return([{'repo' => '1337', 'description' => "Awesome gist", 'created_at' => "2010-04-08 01:09:29 -07:00" }])
    end
    
    let(:newbie) { Githubber.new(:name => "Newbie", :login => "newbie")}
    let(:coder) { Githubber.new(:name => "Coder", :login => "coder") }
    it "returns an array, even if it's empty" do
      newbie.gists.should be_a Array
      newbie.gists.should be_empty
    end
    
    it "formats each gist into a text" do
      coder.gists.first.should == ['1337', "1337 - Awesome gist (2010-04-08 01:09:29 -07:00)"]
    end
  end
end
