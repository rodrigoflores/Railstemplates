module TemplatesHelper  
  def like_counter(template)
    if current_githubber.liked?(template)
      if template.likes.count == 1
        "You like this template"
      else
        "You and more #{pluralize(template.likes.count, "person", "people")} like this template"
      end
    else
      pluralize(template.likes.count, "person like it", "people like it")
    end
  end
end
