module Jr
  module Tasks
    class CurrentTickets < Task
      def display
        report = parse.sort_by { |i| i[headers.index("Assignee")] }
        column_widths report

        print_columns *headers
        report.each do |r|
          print_columns *r
        end
      end

      def parse
        @issues.each_with_object([]) do |issue, report|
          if issue.status == 'In Progress'
            report << [
              issue.summary,
              issue.ticket_id,
              issue.points.to_s,
              issue.assignee,
              Time.diff(issue.created, Time.now)[:diff]
            ]
          end
        end
      end

      protected
      def colors
        [:blue, :red, :green, :light_blue, :yellow]
      end

      def headers
        ["Summary", "Ticket ID", "Points", "Assignee", "Time Since Creation"]
      end
    end
  end
end
