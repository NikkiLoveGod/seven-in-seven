# Modify the CSV application to support an each method to return a CsvRow object. Use method_missing on that CsvRow to
# return the value for the column for a given heading

module ActsAsCsv
  # Extending and including thes are not required for the implementation, but are here for demonstration
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def each &block
      @csv_contents.each { |row| block.call CsvRow.new(@headers, row) }
    end
  end
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

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |row| puts row.heading_3 }