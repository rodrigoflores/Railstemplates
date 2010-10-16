module TemplateCreator

  def new
    @template = Template.new
  end

  def create
    @template = current_githubber.templates.new(params[:template])
    if @template.save
      flash[:notice] = "Template successfully created"
      redirect_to template_url(@template)
    else
      render 'new'
    end
  end
  
end