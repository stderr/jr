require 'jr/issues'
require 'jr/client'
require 'jr/tasks/task'
require 'jr/tasks/point_count'
require 'jr/tasks/current_tickets'

module Jr
  def self.from(username, password, config)
    client = Client.new(config['site'], username, password)
    client.issues(config['jql'])
  end
end
