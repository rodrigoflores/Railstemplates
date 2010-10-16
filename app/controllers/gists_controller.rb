class GistsController < ApplicationController
  include TemplateCreator
  before_filter :authenticate_githubber!, :load_github_from_session
end
