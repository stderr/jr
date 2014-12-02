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
          @assignee = 'Unassigned'
        end
        @created = Time.parse json['fields']['created']
        @summary = json['fields']['summary']
      end

      def closed?
        status == 'Closed'
      end

      def in_qa?
        status == 'QA'
      end

      def in_progress?
        status == 'In Progress'
      end

      def in_feedback?
        status == 'Feedback'
      end

      def under_work?
        in_progress? || in_feedback? || in_qa?
      end
    end
  end
end
