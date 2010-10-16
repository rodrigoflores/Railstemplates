class PagesController < ApplicationController

  def index
    @latest = Template.latest
    @ranked = Template.ranked
  end

end
