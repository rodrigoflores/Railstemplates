module GithubStubs
  def stub_request(url, content = nil)
    response = mock
    
    if content.present?
      case content
      when String
        response.stub!(:body).and_return(content)
      when Hash
        response = content
      end
    end
    
    yield response if block_given?
    
    HTTParty.stub!(:get).with(url).and_return(response)
  end
end

RSpec.configuration.include GithubStubs