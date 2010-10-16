require File.dirname(__FILE__) + '/acceptance_helper'

feature "Creating A Template", %q{
  In order to create a template
  As a githubber
  I want to select a gist and a file from my github profile
} do
  
  background do
    stub_oauth!
    sign_in!
    click_link "Create a new template"

    stub_request "http://gist.github.com/api/v1/json/1337",  { "gists" => [ {"files" => ["main.rb", "Gemfile"] } ] }
    stub_request "http://gist.github.com/raw/1337/main.rb", "GIST CONTENT"

    stub_request "http://github.com/sabbre/base-template/raw/master/template.rb" do |response|
      response.stub(:success?).and_return(true)
      response.stub(:body).and_return("REPO TEMPLATE")
    end
  end

  scenario "successfully creating a template from a gist" do
    fill_in "github_url", :with => "http://gist.github.com/1337"
    click "Next"
    
    fill_in 'Title', :with => "My awesome template"
    fill_in 'Description', :with => "Blablablablablablablablabla"
    select "main.rb", :from => "Gist file"
    click "Create!"
    page.should have_css "h1", :text => "My awesome template"
  end
  
  scenario "checking for required title" do
    fill_in "github_url", :with => "http://gist.github.com/1337"
    click "Next"
    
    fill_in 'Title', :with => ""
    fill_in 'Description', :with => "Blablablablablablablablabla"
    select "main.rb", :from => "Gist file"
    click "Create!"
    within :css, "#template_title_input" do
      page.should have_content "can't be blank"
    end
  end
  
  scenario "successfully creating a template from a file inside a repo" do
    fill_in "github_url", :with => "http://github.com/sabbre/base-template/blob/master/template.rb"
    click "Next"
    
    fill_in 'Title', :with => "My awesome template"
    fill_in 'Description', :with => "Blablablablablablablablabla"
    click "Create!"
  
    page.should have_css "h1", :text => "My awesome template"
  end
  
  scenario "checking for required title" do
    fill_in "github_url", :with => "http://github.com/sabbre/base-template/blob/master/template.rb"
    click "Next"
    
    fill_in 'Title', :with => ""
    fill_in 'Description', :with => "Blablablablablablablablabla"
    click "Create!"
  
    within :css, "#template_title_input" do
      page.should have_content "can't be blank"
    end
  end
  
  
end
