require File.dirname(__FILE__) + '/acceptance_helper'

feature "Searching", %q{
  In order to find sth
  As a developer
  I want to search
} do

  scenario "search" do
    visit '/'
    @user = Factory(:githubber)
    @template = Factory(:template, :title => 'belem do para', :description => "Founded in 1616 by the Portuguese, Belém was the first European colony  on the Amazon but did not become part of Brazil until 1775. Its metropolitan area has approximately 2.09 million inhabitants. It is also known as Metropolis of the Brazilian Amazon region or Cidade das Mangueiras (city of mango trees) due to the number of those trees found in the city. The newer part of the city has modern buildings and skyscrapers.", :githubber => @user)
    fill_in "search", :with => "belem"
    ThinkingSphinx.stub!(:search).with('belem').and_return([@template])
    click_button "search"
    save_and_open_page
    page.should have_content("I have found 1 results for 'belem'")
    within(:css, 'ul') do
      within(:css, 'li') do
        page.should have_content("belem do para")
      end
    end
  end
end
