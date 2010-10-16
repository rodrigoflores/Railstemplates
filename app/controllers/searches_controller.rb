class SearchesController < ApplicationController
  def search
    @templates = ThinkingSphinx.search(params[:search])    
  end

end
