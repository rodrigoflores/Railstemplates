require 'spec_helper'

describe Template do
  it { should have_many :likes }
  it { should validate_presence_of :title, :gist_file }

  describe "content" do
    before do
      stub_request "http://gist.github.com/raw/1337/template.rb", "GIST CONTENT"
      stub_request "http://github.com/sabbre/base-template/raw/master/template.rb", "REPO CONTENT"
    end

    it "fetches the content from a given gist" do
      Template.new(:gist_file => "http://gist.github.com/raw/1337/template.rb").content.should == "GIST CONTENT"
    end

    it "fetches the content from a file" do
      Template.new(:gist_file => "http://github.com/sabbre/base-template/raw/master/template.rb").content.should == "REPO CONTENT"
    end
    
    describe "content sample" do
      before do
        stub_request "http://gist.github.com/raw/999/large_gist",  "GIST CONTENT\n" * 60
      end
      it "returns only 20 lines" do
        template = Template.new(:gist_file => "http://gist.github.com/raw/999/large_gist")
        template.sample.should_not == template.content
        template.sample.split("\n").size.should == 20
      end
    end
  end

end


# == Schema Information
#
# Table name: templates
#
#  id               :integer(4)      not null, primary key
#  title            :string(255)
#  description      :string(255)
#  gist_file        :string(255)
#  githubber_id     :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#  download_counter :integer(4)      default(0)
#

