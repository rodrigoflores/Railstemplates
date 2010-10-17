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
    click_link "All templates"
    click_link @template.title
    within :css, "#working_status" do
      click_link "Yes"
    end
    page.should have_css ".work[title='1 vote']"
  end

  scenario "Downvoting a template", :js => true do
    click_link "All templates"
    click_link @template.title

    within :css, "#working_status" do
      click_link "No"
    end
    page.should have_css ".doesnt-work[title='1 vote']"
  end
end