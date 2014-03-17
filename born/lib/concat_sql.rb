# concatanates a csv line into a suckers array
require "pry"
class ConcatSQL < Array
  def initialize(sucker_line_array)
    @sucker_line_array = sucker_line_array
  end

  def concat_entities(sucker_entities)
    arry =[]
    sucker_entities.each do |sucker|
      arry << ConcatSQL.new(sucker.attributes.values[1..12]).combine
    end
    binding.pry
    arry
  end

  def name_concat
    name = @sucker_line_array.shift(5)
    name.reject { |i| i.empty? }.join(' ')
  end

  def phone_concat
    phone_array = @sucker_line_array.shift(4)
    phone_string = phone_array.reject { |i| i.empty? }.join('-')
    phone_string << ' ' + @sucker_line_array.shift
    phone_string
  end

  def twitter
    @sucker_line_array.shift
  end

  def email
    @sucker_line_array.shift
  end

  def combine
    combined_array = []
    combined_array << name_concat
    combined_array << phone_concat
    combined_array << twitter
    combined_array << email
    combined_array
  end
end
