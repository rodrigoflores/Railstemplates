class Thumb < ActiveRecord::Base
  belongs_to :githubber
  belongs_to :template
  
  validates_uniqueness_of(:githubber_id, :scope_id => [:template_id])
end
