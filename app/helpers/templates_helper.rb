module TemplatesHelper

  def votable_link_to(template, param)
    if current_githubber.voted?(template)
      "javascript:;"
    else
      template_works_path(template, :work => true)
    end
  end

end
