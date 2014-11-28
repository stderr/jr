module Jr
  module Issues
    def self.from(json)
      json.map { |j| Issue.new(j) }
    end

    class Issue
      attr_reader :points, :status, :assignee
      def initialize(json)
        @points = json['fields']['customfield_10004'].to_i
        @status = json['fields']['status']['name']
      end
    end
  end
end
