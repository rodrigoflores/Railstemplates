require File.dirname(__FILE__) + '/acceptance_helper'

feature "Add Work Button", %q{
  In order to rate templates
  As a developer
  I want to mark a template as working or not working
} do

  background do
    stub_oauth!
    sign_in!
    @current_user = Githubber.find_by_email('tyler@soapfactory.com')
    @template = Factory(:template, :githubber => @current_user)
  end

  scenario "Working", :js => true do
    
    visit "/templates/#{@template.id}"
    pending
    
      click_link 'work'
      page.should have_content('1 work')
    
    
  end
end


feature "Add Don't work Button", %q{
  In order to rate templates
  As a developer
  I want to mark a template as working or not working
} do

  background do
    stub_oauth!
    sign_in!
    @current_user = Githubber.find_by_email('tyler@soapfactory.com')
    @template = Factory(:template, :githubber => @current_user)
  end

  scenario "Working", :js => true do
    visit "/templates/#{@template.id}"
    pending
    
      click_link "don't work"
      page.should have_content("1 don't work")
    
    
  end
end