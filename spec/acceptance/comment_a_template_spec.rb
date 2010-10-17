require File.dirname(__FILE__) + '/acceptance_helper'

feature "Comment A Template", %q{
  In order to tell a template that it is awesome 
  As an user
  I want to comment on a template
} do

  background do
    stub_oauth!
    visit homepage
    @template = Factory(:template, :title => 'belem do para', :description => "Trolololo.", :githubber => Factory(:githubber))
  end

  scenario "valid comment", :js => true do
    sign_in!
    click_link "All templates"
    click_link @template.title
    fill_in "Comment this template", :with => "This template is fucking awesome"
    expect {
      click_button "Create Commentary"
    }.to change(@template.commentaries, :count).by(1)    
  end
  
  scenario "should say that you must be logged in to comment", :js => true do
    click_link "All templates"
    pending "A error on the page"
    click_link @template.title
    page.should have_content("Log in to comment this template")
  end
end
