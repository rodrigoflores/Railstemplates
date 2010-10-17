require File.dirname(__FILE__) + '/acceptance_helper'

feature "Viewing All The Templates", %q{
  In order to view the templates on the site
  As a person
  I want to view all the templates
} do

  background do
    5.times { Factory(:template) }
    visit homepage
  end
  scenario "Opening the page" do
    click_link "All templates"

    Template.all.each do |t|
      page.should have_link t.title
    end
  end
end
