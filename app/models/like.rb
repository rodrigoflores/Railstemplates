class Like < ActiveRecord::Base
  belongs_to :githubber
  belongs_to :template
  validates_uniqueness_of :template_id, :scope => [:githubber_id]
end
