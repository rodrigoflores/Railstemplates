require 'spec_helper'

describe Template do
  it { should have_many :likes }
  it { should have_many :thumbs}
  it { should have_many :commentaries }
  it { should belong_to :githubber}
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
  end

  describe "tags" do
    subject do
      Factory.build(:template)
    end
    
    context "when assigning" do
      it "should accept a list of tags" do
        subject.tag_list = "rails, mysql, solr"
        subject.save
        subject.tags.map(&:name).should == ["rails", "mysql", "solr"]
      end
    end
  end
  
  context "vote status" do
    before do
      @template = Factory(:template)
      @blank = Factory(:template)
      2.times { Factory(:githubber).vote(@template, true) }
    end
    
    it "summarizes the percentages" do
      @template.stats[:working].should == [2, 100.0]
      @template.stats[:not_working].should == [0, 0.0]

      @blank.stats[:working].should == [0, 0.0]
      @blank.stats[:not_working].should == [0, 0.0]

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

