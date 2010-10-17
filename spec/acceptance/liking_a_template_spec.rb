require File.dirname(__FILE__) + '/acceptance_helper'

feature "Liking a template", %q{
  In order to like a template
  As a githubber
  I want to like a given template
} do
  
  background do
    stub_oauth!
    visit homepage
    @template = Factory(:template, :title => 'belem do para', :description => "Trolololo.", :githubber => Factory(:githubber))
  end

  scenario "Trying to like a template when not authenticated" do
    click_link "All templates"
    click_link @template.title
    click_link "I like it"
    should_be_on "githubbers/sign_in"
  end

  scenario "Liking a template", :js => true do
    sign_in!
    click_link "All templates"
    click_link @template.title
    
    page.should have_content "0 people like it"
    click_link 'I like it'

    page.should have_content "1 person like it"
    page.should_not have_css "#like_button"
  end

  scenario "destroyin a like", :js => true do
    disabled "Selenium does not approve window.confirm :(" do
      sign_in!
      click_link "All templates"
      click_link @template.title

      click_link 'I like it'
      click_link "Dashboard"
      click_link "Unlike it"

      click_link @template.title
      page.should have_css "#like_button"
    end
  end
end
