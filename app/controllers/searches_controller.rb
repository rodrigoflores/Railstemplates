class SearchesController < ApplicationController
  def search
    # TODO: Total Count + Pagination
    search = ThinkingSphinx.search(params[:search])
    @total = search.count
    @templates = search.paginate(:page => params[:page])
  end

end
