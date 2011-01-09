require 'spec_helper'

describe Like do
  describe 'associations' do
    it { should belong_to :githubber }
    it { should belong_to :template }
  end

  describe 'validations do' do
    it do
      @user = Factory(:githubber, :email => 'aaaa@bbb.com')
      @template = Factory(:template, :githubber => @user)
      @like = Factory(:like, :githubber => @user, :template => @template)
      should validate_uniqueness_of(:template_id).scoped_to(:githubber_id)
    end
  end
end

# == Schema Information
#
# Table name: likes
#
#  id           :integer(4)      not null, primary key
#  githubber_id :integer(4)
#  template_id  :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

