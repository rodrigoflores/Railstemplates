require File.dirname(__FILE__) + '/acceptance_helper'

feature "Authenticating With Github Account", %q{
  In order to acess the website
  As a github user
  I want to authenticate using my github account
} do

  background do
    stub_oauth!
  end
  
  scenario "succesfully sign in" do
    visit homepage
    click_link "Sign in using Github"
    should_be_on "dashboard"
    page.should have_content "Hello, Tyler Durden"
  end
  
  scenario "signin out" do
    visit homepage
    click_link "Sign in using Github"
    click_link "Sign out"
    should_be_on "/"
    page.should have_link "Sign in using Github"
  end
  
  scenario "updating my infos on github" do
    visit homepage
    click_link "Sign in using Github"
    page.should have_content "Hello, Tyler Durden"
    click_link "Sign out"
    updating_github_values :name => 'Wylkon Cardoso' do
      visit homepage
      click_link "Sign in using Github"
      page.should have_content "Hello, Wylkon Cardoso"
    end
  end
end
