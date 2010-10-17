class LikesController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_filter :authenticate_githubber!

  def create
    template = Template.find(params[:template_id])
    like = current_githubber.like_it template
    if like.persisted?
      render :json => { :status => pluralize(template.likes.count, "person like it", "people like it") }
    else
      render :json => {}, :status => 406
    end
  end
  
  def destroy
    template = Template.find(params[:template_id])
    like = current_githubber.unlike_it template
    if like
      render :json => { :status => "OK" }
    else
      render :json => {}, :status => 406
    end
  end

end