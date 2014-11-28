require 'jr/issues'
require 'jr/client'

module Jr
  def self.from(username, password, config)
    client = Client.new(config['site'], username, password)
    client.issues(config['jql'])
  end

  # Configuration
  class << self
    attr_accessor :config
  end
end
