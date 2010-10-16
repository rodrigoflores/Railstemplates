require 'spec_helper'

describe Thumb do
  describe 'validations' do
    it do
      @user = Factory(:githubber)
      @template = Factory(:template)
      @thumb = Factory(:thumb, :githubber => @user, :template => @template)
      should validate_uniqueness_of(:githubber_id, :scope_id => [:template_id])
    end
  end
  
  describe 'associations' do
    it { should belong_to :githubber }
    it { should belong_to :template   }
  end
  
end
