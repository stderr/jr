module Jr
  module Tasks
    class AllTickets < Task
      def display
        report = parse.sort_by { |i| i[headers.index("Ticket ID")] }
        column_widths report

        print_columns *headers
        report.each do |r|
          print_columns *r
        end
      end

      protected
      def colors
        [:blue, :red, :green, :light_green, :light_blue, :yellow]
      end

      def headers
        ["Summary", "Ticket ID", "Status", "Points", "Assignee", "Time Since Creation"]
      end

      def parse
        @issues.map do |issue|
          [
            issue.summary,
            issue.ticket_id,
            issue.status,
            issue.points.to_s,
            issue.assignee,
            Time.diff(issue.created, Time.now)[:diff]
          ]
        end
      end
    end
  end
end
