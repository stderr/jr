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
      def headers
        []
      end

      def column_widths(rows)
        @widths ||= begin 
                      memo = apply_colors(*headers).map(&:length)

                      rows.each_with_object(memo) do |row, widths|
                        row = apply_colors(*row)
                        row.each_with_index do |text, i|
                          if text.length > widths[i]
                            widths[i] = text.length
                          end
                        end
                      end
                      memo.map { |i| i+=5 }
                    end
      end

      def print_columns(*columns)
        format = ""
        columns.each_with_index do |c, i|
          format << "%-#{@widths[i]}s "
          if i == columns.size - 1
            format << "\n"
          end
        end
        columns = apply_colors(*columns)
        printf format, *columns
      end

      def apply_colors(*columns)
        columns.each_with_index.map do |c, i|
          c.send(colors[i])
        end
      end
    end
  end
end
