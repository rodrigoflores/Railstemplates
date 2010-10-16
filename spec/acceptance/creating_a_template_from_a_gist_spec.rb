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
    json_response = { "gists" => [{"files" => ["main.rb", "Gemfile"] } ] }
    
    HTTParty.stub!(:get).with("http://gist.github.com/api/v1/json/1337").and_return(json_response)
  end

  scenario "successfully creating a template from a gist" do
    fill_in "gist_url", :with => "http://gist.github.com/1337"
    click "Next"
    
    fill_in 'Title', :with => "My awesome template"
    fill_in 'Description', :with => "Blablablablablablablablabla"
    select "main.rb", :from => "Gist file"
    click "Create!"
  end
end
