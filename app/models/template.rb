class Template < ActiveRecord::Base
  
  acts_as_taggable
  
  define_index do
    indexes title
    indexes description
    indexes tags(:name), :as => :tags
    indexes githubber(:name), :as => :githubber_name
    indexes githubber(:login), :as => :githubber_login
  end
  
  scope :latest, limit(5).order("created_at DESC")

  scope :ranked, limit(5).joins(:likes).group('templates.id').order('count(likes.id) DESC')

  has_many :likes, :dependent => :delete_all
  has_many :thumbs, :dependent => :delete_all
  belongs_to :githubber
  validates :title, :source_url, :presence => true
  
  def content
    Github.new(self.source_url).raw
  end
  
  def download!
    increment!(:download_counter)
    content
  end
  
  def upvotes
    self.thumbs.where(:up => true).count
  end
  
  def downvotes
    self.thumbs.where(:up => false).count
  end
  
  def stats
    @stats ||= Hash.new.tap do |status|
       total = self.thumbs.count
       total = 1 if total == 0 #avoidin NaN
       status[:working] = [upvotes, (upvotes / total.to_f) * 100]
       status[:not_working] = [downvotes, (downvotes / total.to_f) * 100]
     end
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

