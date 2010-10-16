class Gist
  include ActiveModel::Validations
  
  # validates_format_of :url, :with => /(http|https):\/\/(gist\.)?github\.com\/((\w|\/|\.)+)/
  
  attr_reader :gist_url

  def initialize(gist_url)
    # "http://gist.github.com/1337"
    @gist_url = gist_url
    @gist_id = @gist_url.split('/').last
  end
  
  def files
    @files ||= HTTParty.get("http://gist.github.com/api/v1/json/#{@gist_id}")['gists'].first['files'].map do |f|
      [f, "http://gist.github.com/raw/#{@gist_id}/#{f}"]
    end
  end



  # include HTTParty
  # base_uri "http://gist.github.com/"
  # class << self
  #   def find(login)
  #     get("/api/v1/json/gists/#{login}")['gists']
  #   end
  # end
end