require File.dirname(__FILE__) + '/acceptance_helper'

feature "Creating A Template From A Gist", %q{
  In order to create a template from a gist
  As a githubber
  I want to select a gist and a file from my github profile
} do
  
  background do
    stub_oauth!
    sign_in!
    click_link "Create a new template"
  end

  scenario "successfully creating a template from a gist" do
    fill_in 'Title', :with => 'My awesome template'
  end
end
