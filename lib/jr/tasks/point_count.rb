module Jr
  module Tasks
    class PointCount < Task
      def display
        report = parse.map(&:to_s)
        column_widths(report)
        print_columns *headers

        print_columns *report
      end

      protected
      def colors
        [:yellow, :green, :blue]
      end

      def headers
        ["Total", "Active", "Closed"]
      end

      def parse
        @issues.each_with_object([0, 0, 0]) do |issue, report|
          total = headers.index("Total")
          active = headers.index("Active")
          closed = headers.index("Closed")

          report[total] += issue.points
          if issue.status == 'Closed'
            report[closed] +=  issue.points
          elsif issue.status == 'In Progress'
            report[active] += issue.points
          end
        end
      end
    end
  end
end
