require File.dirname(__FILE__) + '/acceptance_helper'

feature "Liking a template", %q{
  In order to like a template
  As a githubber
  I want to like a given template
} do
  
  background do
    stub_oauth!
    sign_in!
    visit homepage
  end

  scenario "Liking a template", :js => true do
    template = Factory(:template, :title => 'belem do para', :description => "Trolololo.", :githubber => Factory(:githubber))
    click_link "All templates"
    click_link template.title
    
    page.should have_css "strong", :text => '0'
    click_link 'Like it'

    click_link "All templates"
    click_link template.title
    page.should have_css "strong", :text => '1'
  end
end
