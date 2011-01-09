require File.dirname(__FILE__) + '/acceptance_helper'

feature "Searching", %q{
  In order to find sth
  As a developer
  I want to search
} do
  background do
    user = Factory(:githubber)
    template = Factory(:template,
                        :title => 'belem do para', 
                        :description => "Founded in 1616 by the Portuguese, Belém was the first European colony on the Amazon...",
                        :githubber => user)
    ThinkingSphinx.stub!(:search).with('belem').and_return([template])
    ThinkingSphinx.stub!(:search).with('many').and_return([template, template])
    visit '/'
  end

  scenario "search returns a single item" do
    fill_in "q", :with => "belem"
    click_button "search"
    page.should have_content("We have found 1 result for 'belem'")
    page.should have_link "belem do para"
  end

  scenario "search returns multiple itens" do
    fill_in "q", :with => "many"
    click_button "search"
    page.should have_content("We have found 2 results for 'many'")
  end
end
