class Commentary < ActiveRecord::Base
  validates_presence_of :commentary
  belongs_to :githubber
  belongs_to :template
end
