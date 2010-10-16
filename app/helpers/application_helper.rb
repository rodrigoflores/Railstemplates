require 'digest/md5'

module ApplicationHelper

  def gravatar_for(githubber)
    hash = Digest::MD5.hexdigest(githubber.email)
    image_tag "http://www.gravatar.com/avatar/#{hash}?s=40"
  end

end
