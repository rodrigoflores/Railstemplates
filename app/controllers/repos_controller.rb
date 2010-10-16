class ReposController < ApplicationController
  before_filter :load_github_from_session
  include TemplateCreator
end
