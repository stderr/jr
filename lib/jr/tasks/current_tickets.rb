require 'colorize'
require 'time_diff'

module Jr
  module Tasks
    class CurrentTickets < Task
      def display
        report = parse.sort_by { |i| i[:person] }
        print_columns "Ticket ID".red, "Assignee".blue, "Summary".green, "Time Spent".yellow
        report.each do |r|
          print_columns r[:ticket_id].red, r[:person].blue, r[:name].green, r[:time_spent].yellow
        end
      end

      def parse
        @issues.each_with_object([]) do |issue, report|
          if issue.status == 'In Progress'
            report << {
              ticket_id: issue.ticket_id,
              person: issue.assignee,
              time_spent: "#{Time.diff(issue.created, Time.now)[:days]} days",
              name: issue.summary
            }
          end
        end
      end

      protected
      def column_width
        75
      end
    end
  end
end
