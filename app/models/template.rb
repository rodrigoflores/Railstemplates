class Template < ActiveRecord::Base
  
  define_index do
    indexes title
    indexes description
  end
  
  
  belongs_to :githubber
  validates :title, :gist_file, :presence => true
  
  def content
    Github.new(self.gist_file).raw
  end
  
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

