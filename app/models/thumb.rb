class Thumb < ActiveRecord::Base
  belongs_to :githubber
  belongs_to :template
  
  validates_uniqueness_of :githubber_id, :scope => [:template_id]
end

# == Schema Information
#
# Table name: thumbs
#
#  id           :integer(4)      not null, primary key
#  up           :boolean(1)
#  template_id  :integer(4)
#  githubber_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

# == Schema Information
#
# Table name: thumbs
#
#  id           :integer(4)      not null, primary key
#  up           :boolean(1)
#  template_id  :integer(4)
#  githubber_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

