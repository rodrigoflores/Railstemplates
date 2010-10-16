require File.dirname(__FILE__) + '/acceptance_helper'

feature "My Templates", %q{
  In order to ...
  As a ...
  I want to ...
} do
  
  background do 
    stub_oauth!
    sign_in!
    @current_user = Githubber.find_by_email('tyler@soapfactory.com')
    @templates = []
    10.times do 
      @templates << Factory(:template, :githubber => @current_user)
    end
  end

  scenario "Listing templates" do
    visit "my_templates/"
    save_and_open_page
    @templates.each do |template|
      page.should have_content(template.title)      
    end
      
    
    
  end
end
