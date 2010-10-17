class LikesController < ApplicationController
  include ActionView::Helpers::TextHelper
  include TemplatesHelper
  
  before_filter :authenticate_githubber!

  def create
    template = Template.find(params[:template_id])
    like = current_githubber.like_it template
    if like.persisted?
      render :json => { :status => like_counter(template) }
    else
      render :json => {}, :status => 406
    end
  end
  
  def destroy
    template = Template.find(params[:template_id])
    like = current_githubber.unlike_it template
    if like
      render :json => {}
    else
      render :json => {}, :status => 406
    end
  end

end