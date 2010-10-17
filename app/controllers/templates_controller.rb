class TemplatesController < InheritedResources::Base
  respond_to :html
  before_filter :authenticate_githubber!, :only => [:new, :create, :edit, :update, :destroy]

  def download
    @template = Template.find(params[:id])
    send_data @template.download!
  end

  def show
    @template = Template.find(params[:id])
    respond_with(@template)
  end

  def new
    @template = Template.new
    respond_with(@template)
  end

  def create
    @github = Github.new(params[:github_url])
    if @github.invalid?
      flash[:invalid]= "Looks like '#{params[:github_url]}' is neither a gist or a file under a github repository."
      redirect_to new_template_path
      return
    end

    githubber_session[:github_url] = @github.original_url

    if @github.gist?
      redirect_to new_gist_path
    else
      redirect_to new_repo_path
    end
  end

  def index
    @templates = Template.latest.except(:limit).paginate(:page => params[:page], :per_page => 10)
  end

  private
  def begin_association_chain
    current_githubber
  end

end
