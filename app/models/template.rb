class Template < ActiveRecord::Base
  
  acts_as_taggable
  
  define_index do
    indexes title
    indexes description
    indexes tags(:name), :as => :tags
    indexes githubber(:name), :as => :githubber_name
    indexes githubber(:login), :as => :githubber_login
  end
  
  has_many :likes
  belongs_to :githubber
  validates :title, :gist_file, :presence => true
  
  def content
    Github.new(self.gist_file).raw
  end
  
  def sample
    content.split("\n")[0,20].join("\n")
  end
  
  def download!
    increment(:download_counter)
    save
    content
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

