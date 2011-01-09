require 'spec_helper'

describe Thumb do
  describe 'validations' do
    it do
      @user = Factory(:githubber)
      @template = Factory(:template)
      @thumb = Factory(:thumb, :githubber => @user, :template => @template)
      should validate_uniqueness_of(:githubber_id).scoped_to(:template_id)
    end
  end

  describe 'associations' do
    it { should belong_to :githubber }
    it { should belong_to :template }
  end

end

# == Schema Information
#
# Table name: thumbs
#
#  id           :integer(4)      not null, primary key
#  up           :boolean(1)
#  template_id  :integer(4)
#  githubber_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#