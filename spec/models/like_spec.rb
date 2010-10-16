require 'spec_helper'

describe Like do
  describe 'associations' do
    it { should belong_to :githubber }
    it { should belong_to :template }
  end
  
  describe 'validations do' do
    it do
      @user = Factory(:githubber)
      @template = Factory(:template, :githubber => @user)
      @like = Factory(:like, :githubber => @user, :template => @template)
      should validate_uniqueness_of(:template_id, :scope => [:githubber_id])
    end
  end
end
