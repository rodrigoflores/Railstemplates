require File.dirname(__FILE__) + '/acceptance_helper'

feature "Add Work Button", %q{
  In order to rate templates
  As a githubber
  I want to upvote or downvote  template
} do

  background do
    stub_oauth!
    sign_in!
    @template = Factory(:template, :githubber => current_githubber)
  end

  scenario "Upvoting a template", :js => true do
    disabled "We need to verify this operation" do
      click_link "All templates"
      click_link @template.title
    
      click_link "Yes !"

      click_link "All templates"
      click_link @template.title
    end
  end

  scenario "Downvoting a template", :js => true do
    disabled "We need to verify this operation" do
      click_link "All templates"
      click_link @template.title
  
      click_link "No :("

      click_link "All templates"
      click_link @template.title
    end
  end
end