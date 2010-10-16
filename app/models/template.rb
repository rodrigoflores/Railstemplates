class Template < ActiveRecord::Base
  
  define_index do
    indexes title
    indexes description
  end
  
  has_many :likes
  belongs_to :githubber
  validates :title, :gist_file, :presence => true
  
  def content
    Github.new(self.gist_file).raw
  end
  
  def sample
    content.split("\n")[0,50].join("\n")
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

