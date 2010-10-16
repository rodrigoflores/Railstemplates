class Github
  attr_reader :original_url

  def initialize(url)
    @original_url = url
    @gist_id = url.split('/').last
  end

  def files
    @files ||= HTTParty.get("http://gist.github.com/api/v1/json/#{@gist_id}")['gists'].first['files'].map do |f|
      [f, "http://gist.github.com/raw/#{@gist_id}/#{f}"]
    end
  end

  def gist?
    /^(http|https):\/\/gist.*$/ =~ @original_url
  end

  def repo?
    !gist? && /(http|https):\/\/(gist\.)?github\.com\/(\w*)\/.*\/blob\/((\w|\/|\.)+)/ =~ @original_url && valid_file?
  end

  def invalid?
    !gist? && !repo?
  end

  private
  def valid_file?
    HTTParty.get(@original_url.gsub("/blob/", "/raw/")).success?
  end

end