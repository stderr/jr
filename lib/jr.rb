require 'colorize'
require 'time_diff'
require 'active_support/core_ext/string'

module Jr
  def self.from(username, password, config)
    client = Client.new(config['site'], username, password)
    client.issues(config['jql'])
  end
end

require 'jr/issues'
require 'jr/client'
require 'jr/tasks/task'
require 'jr/tasks/point_count'
require 'jr/tasks/current_tickets'
