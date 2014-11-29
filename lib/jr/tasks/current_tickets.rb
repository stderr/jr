require 'colorize'
require 'time_diff'

module Jr
  module Tasks
    class CurrentTickets < Task
      def display
        report = parse.sort_by { |i| i[1] }
        column_widths(report)

        print_columns *headers
        report.each do |r|
          print_columns *r
        end
      end

      def parse
        @issues.each_with_object([]) do |issue, report|
          if issue.status == 'In Progress'
            report << [
              issue.ticket_id,
              issue.assignee,
              issue.summary,
              Time.diff(issue.created, Time.now)[:diff]
            ]
          end
        end
      end

      protected
      def colors
        [:red, :blue, :green, :yellow]
      end

      def headers
        ["Ticket ID", "Assignee", "Summary", "Time Since Creation"]
      end
    end
  end
end
