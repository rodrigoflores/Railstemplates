class Like < ActiveRecord::Base
  belongs_to :githubber
  belongs_to :template
  validates_uniqueness_of :template_id, :scope => [:githubber_id]
end

# == Schema Information
#
# Table name: likes
#
#  id           :integer(4)      not null, primary key
#  githubber_id :integer(4)
#  template_id  :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

