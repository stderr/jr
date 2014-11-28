require 'active_support/core_ext/string'

module Jr
  module Tasks
    def self.load(task_name, issues)
      self.const_get(task_name.to_s.camelize).new(issues)
    end

    class Task
      def initialize(issues)
        @issues = issues
      end

      protected
      def column_width
        30
      end

      def print_columns(*columns)
        format = ""
        columns.each_with_index do |c, i|
          format << "%-#{column_width}s "
          if i == columns.size - 1
            format << "\n"
          end
        end
        printf format, *columns
      end
    end
  end
end
