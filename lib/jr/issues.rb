module Jr
  module Issues
    def self.from(json)
      json.map { |j| Issue.new(j) }
    end

    class Issue
      attr_reader :points, :status, :assignee, :created, :summary, :ticket_id

      def initialize(json)
        @points = json['fields']['customfield_10004'].to_i
        @status = json['fields']['status']['name']
        @ticket_id = json['key']
        if json['fields']['assignee']
          @assignee = json['fields']['assignee']['displayName']
        else
          @assignee = 'None'
        end
        @created = Date.parse json['fields']['created']
        @summary = json['fields']['summary']
      end
    end
  end
end
