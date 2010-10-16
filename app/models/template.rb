class Template < ActiveRecord::Base
  belongs_to :githubber
  validates :title, :presence => true
end
