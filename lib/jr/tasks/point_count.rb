require 'colorize'

module Jr
  module Tasks
    class PointCount < Task
      def display
        report = parse
        print_columns "Active".yellow, "Closed".green, "Total".blue
        print_columns report[:active].to_s.yellow, report[:closed].to_s.green, report[:total].to_s.blue
      end

      private
      def parse
        @issues.each_with_object({total: 0, active: 0, closed: 0}) do |issue, report|
          report[:total] += issue.points 
          if issue.status == 'Closed'
            report[:closed] +=  issue.points
          elsif issue.status == 'In Progress'
            report[:active] += issue.points
          end
        end
      end
    end
  end
end
