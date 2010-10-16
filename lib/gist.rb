module Gist
  include HTTParty
  base_uri "http://gist.github.com/"
  class << self
    def find(login)
      get("/api/v1/json/gists/#{login}")['gists']
    end
  end
end