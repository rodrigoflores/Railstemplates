class DownloadConstraint
  def self.matches?(request)
    Template.exists?(request.params[:id])
  end
end