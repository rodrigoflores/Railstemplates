class CommentariesController < ApplicationController
  before_filter :authenticate_githubber!

  def create
    template = Template.find(params[:template_id])
    commentary = template.commentaries.create(params[:commentary].merge(:githubber_id => current_githubber.id))
    if commentary.persisted?
      render :json => { :text => commentary.commentary, :author => commentary.githubber }
    else
      render :json => {}, :status => 406
    end
  end

end