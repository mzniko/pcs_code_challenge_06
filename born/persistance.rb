require 'pry'
require_relative 'lib/concat_csv.rb'
require 'csv'

# makes suckers happen
class SuckerList
  def suckers_display
    display = []
    CSV.foreach('people.csv') do |line|
      new_sucker = ConcatCsv.new(line).combine
      display << new_sucker
    end
    display
  end

  def goto(line)
    csv_line = CSV.readlines('people.csv')[line]
    ConcatCsv.new(csv_line).combine
  end
end
