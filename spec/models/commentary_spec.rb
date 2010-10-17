require 'spec_helper'

describe Commentary do
  describe 'validations' do
    it { should validate_presence_of :commentary }
  end
  
  describe 'association' do
    it { should belong_to :githubber }
    it { should belong_to :template }
  end
end
