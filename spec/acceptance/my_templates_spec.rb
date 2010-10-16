require File.dirname(__FILE__) + '/acceptance_helper'

feature "My Templates", %q{
  In order to edit and view my templates
  As a user
  I want to edit, delete, update and view my templates
} do
  
  background do 
    stub_oauth!
    sign_in!
    @current_user = Githubber.find_by_email('tyler@soapfactory.com')

  end

  scenario "Listing templates" do
    @templates = 10.times.map do 
      Factory(:template, :githubber => @current_user)
    end
    
    visit '/my_templates'
    
    @templates.each do |template|
      page.should have_content(template.title)      
    end
  end
  
  scenario "Show templates" do
    @template = Factory(:template, :githubber => @current_user, :description => "ahndfiasfndpia")
    visit '/my_templates'
    click_link "show"
    page.should have_content(@template.title)
    page.should have_content(@template.description)
  end
  
  scenario "Edit template" do
    @template = Factory(:template, :githubber => @current_user, :description => "ahndfiasfndpia")
    visit '/my_templates'
    click_link "edit"
    fill_in 'Title', :with => "Asisaca"
    fill_in "Description", :with => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    click_button "Update"
    page.should have_content(@template.reload.title)
    page.should have_content(@template.reload.description)
  end
  
  scenario "Delete template" do
    @template = Factory(:template, :githubber => @current_user, :description => "ahndfiasfndpia")
    visit '/my_templates'
    click_link "delete"
    page.should have_no_content(@template.reload.title)
    page.should have_no_content(@template.reload.description)
  end
end
