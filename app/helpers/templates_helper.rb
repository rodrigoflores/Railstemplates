module TemplatesHelper

  def votable_link_to(template, params = {})
    if current_githubber.voted?(template)
      "javascript:;"
    else
      template_works_path(template, params)
    end
  end

end
