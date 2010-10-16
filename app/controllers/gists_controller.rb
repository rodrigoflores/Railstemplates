class GistsController < ApplicationController
  include TemplateCreator
  before_filter :load_github_from_session
end
