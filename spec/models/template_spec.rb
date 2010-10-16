require 'spec_helper'

describe Template do
  it { should validate_presence_of :title }
end

# == Schema Information
#
# Table name: templates
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  description  :string(255)
#  gist_file    :string(255)
#  githubber_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

