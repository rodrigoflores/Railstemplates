class Github
  attr_reader :original_url

  def initialize(url)
    @original_url = url
  end

  def gist_files
    gist = original_url.split('/').last
    @files ||= HTTParty.get("http://gist.github.com/api/v1/json/#{gist}")['gists'].first['files'].map do |f|
      [f, "http://gist.github.com/raw/#{gist}/#{f}"]
    end
  end
  
  def raw_url
    @original_url.gsub("/blob/", "/raw/")
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
    HTTParty.get(raw_url).success?
  end

end