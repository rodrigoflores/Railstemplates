module HelperMethods
  # Put helper methods you need to be available in all tests here.
  def should_be_on(path)
    page.current_url.should match(Regexp.new(path))
  end
  
end

RSpec.configuration.include HelperMethods, :type => :acceptance
