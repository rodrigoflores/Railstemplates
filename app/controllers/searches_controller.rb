class SearchesController < ApplicationController

  def show
    @query = params[:q]
    search = ThinkingSphinx.search(@query)
    @total = search.count
    @templates = search.paginate(:page => params[:page], :per_page => 10)
  end

end
