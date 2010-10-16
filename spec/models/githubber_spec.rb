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

# == Schema Information
#
# Table name: githubbers
#
#  id                 :integer(4)      not null, primary key
#  email              :string(255)     default(""), not null
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

