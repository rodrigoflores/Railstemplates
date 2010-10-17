class DownloadConstraint
  def matches?(request)
    Template.exists?(request.params[:id])
  end
end