class SearchesController < ApplicationController
  def search
    search = ThinkingSphinx.search(params[:search])
    @total = search.count
    @templates = search.paginate(:page => params[:page], :per_page => 10)
  end

end
