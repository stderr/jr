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
        [:yellow, :green, :blue, :red]
      end

      def headers
        ["Total", "Active", "Closed", "Left"]
      end

      def parse
        total = headers.index("Total")
        active = headers.index("Active")
        closed = headers.index("Closed")
        left = headers.index("Left")

        report = @issues.each_with_object([0, 0, 0, 0]) do |issue, report|
          report[total] += issue.points

          if issue.closed?
            report[closed] +=  issue.points
          elsif issue.under_work?
            report[active] += issue.points
          end
        end

        report[left] = report[total] - report[closed]
        report
      end
    end
  end
end
