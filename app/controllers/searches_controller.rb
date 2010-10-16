class SearchesController < ApplicationController
  def search
    # TODO: Total Count + Pagination
    @templates = ThinkingSphinx.search(params[:search])    
  end

end
