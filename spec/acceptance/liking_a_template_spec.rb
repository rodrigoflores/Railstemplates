require File.dirname(__FILE__) + '/acceptance_helper'

feature "Liking a template", %q{
  In order to like a template
  As a githubber
  I want to like a given template
} do
  
  background do
    stub_oauth!
    sign_in!
  end

  scenario "Liking a template" do
    @user = Factory(:githubber)
    @template = Factory(:template, :title => 'belem do para', :description => "Founded in 1616 by the Portuguese, Belém was the first European colony  on the Amazon but did not become part of Brazil until 1775. Its metropolitan area has approximately 2.09 million inhabitants. It is also known as Metropolis of the Brazilian Amazon region or Cidade das Mangueiras (city of mango trees) due to the number of those trees found in the city. The newer part of the city has modern buildings and skyscrapers.", :githubber => @user)
    visit "/templates/#{@template.id}"
    @template.likes.count.should == 0
    pending "Fix this whole spec" do
      expect {
        click_link 'Like'
      }.to change(current_githubber.likes(true), :count).by(1)
    end
    @template.likes(true).count.should == 1
  end
end
