module Jr
  module Issues
    def self.from(json)
      @issues = json.map { |j| Issue.new(j) }
      self
    end

    def self.point_count
      @issues.each_with_object({total: 0, active: 0, closed: 0}) do |issue, report|
        report[:total] += issue.points 
        if issue.status == 'Closed'
          report[:closed] +=  issue.points
        elsif issue.status == 'In Progress'
          report[:active] += issue.points
        end
      end
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
