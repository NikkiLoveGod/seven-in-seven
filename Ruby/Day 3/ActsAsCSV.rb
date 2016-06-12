# Modify the CSV application to support an each method to return a CsvRow object. Use method_missing on that CsvRow to
# return the value for the column for a given heading

module ActsAsCsv
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def each
      @csv_contents.each { |row| yield row }
    end

  class CsvRow
    # Figure out how you can return CsvRow object from ActAsCsv .each
    # Create a map of values to index
    # Return that index in method_missing
    attr_accessor :row

    def initialize(headers, row)
      @row = Hash[headers.zip row]
    end

    def method_missing name, *args
      @row[name.to_s]
    end
  end
end

class RubyCsv
  include ActsAsCsv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |row| puts row.heading_3 }