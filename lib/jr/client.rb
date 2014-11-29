require 'faraday'
require 'json'

module Jr
  class Client
    def initialize(site, username, password)
      @connection = Faraday.new(url: site)
      @connection.basic_auth(username, password)
      self
    end

    def issues(jql)
      response = @connection.post do |request|
        request.url '/rest/api/2/search'
        request.headers['Content-Type'] = 'application/json'
        request.body = %Q|{"jql": "#{jql}"}|
      end

      Issues.from JSON.parse(response.body)['issues']
    end
  end
end

