class Githubbers::TemplatesController < InheritedResources::Base
  before_filter :authenticate_githubber!

  protected
    
    def begin_of_association_chain
      current_githubber
    end
  
end
