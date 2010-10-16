class Githubbers::TemplatesController < InheritedResources::Base
  before_filter :authenticate_githubber!
  
  
  
  private
  def begin_association_chain
    current_githubber
  end
  
end
