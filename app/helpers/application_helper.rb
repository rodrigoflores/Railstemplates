require 'digest/md5'

module ApplicationHelper

  def gravatar_for(githubber, size = 40)
    unless githubber.email.blank?
      hash = Digest::MD5.hexdigest(githubber.email)
      image_tag "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
    else
      image_tag "http://www.gravatar.com/avatar/00000000000000000000000000000000?s=#{size}"
    end
  end

end
