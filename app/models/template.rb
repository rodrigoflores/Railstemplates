class Template < ActiveRecord::Base
  
  define_index do
    indexes title
    indexes description
  end
  
  
  belongs_to :githubber
  validates :title, :presence => true
end
