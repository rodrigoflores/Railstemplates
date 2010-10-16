require File.dirname(__FILE__) + '/acceptance_helper'

feature "Visiting The Home Page", %q{
  In order to visit the site
  As a person
  I want to open the home and find out about the site
} do

  background do
    10.times { Factory(:template, :githubber => current_githubber) }
    10.times do |n|
      template = Factory(:template, :githubber => current_githubber)
      (n % 4).times do
        Factory(:githubber).like_it(template)
      end
    end
  end

  scenario "Viewing the top 5 templates" do
    visit homepage
    ranked = Template.ranked
    page.should have_css "#ranked li", :count => 5
    within :css, "#ranked" do
      ranked.each do |template|
        page.should have_link(template.title)
      end
    end
  end

  scenario "Viewing the latest 5 templates" do
    visit homepage
    latest = Template.latest
    page.should have_css "#latest li", :count => 5
    within :css, "#latest" do
      latest.each do |template|
        page.should have_link(template.title)
      end
    end
  end

end
