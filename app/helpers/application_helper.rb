require 'digest/md5'

module ApplicationHelper

  def gravatar_for(githubber)
    hash = Digest::MD5.hexdigest(githubber.email)
    image_tag "http://www.gravatar.com/avatar/#{hash}?s=40"
  end

  def pluralize_with_html(count, singular)
    text = count == 1 ? singular : singular.pluralize
    content_tag(:strong, count) + text
  end
end
