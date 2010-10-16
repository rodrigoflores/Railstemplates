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
    page.should have_content "Tyler Durden"
  end
  
  scenario "signin out" do
    visit homepage
    click_link "Sign in using Github"
    click_link "Sign out"
    should_be_on "/"
  end
end
