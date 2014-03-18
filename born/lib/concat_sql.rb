# concatanates a csv line into a suckers array
require "pry"
module ConcatSQL
  def ConcatSQL.concat_entities(sucker_entities)
    arry =[]
    sucker_entities.each do |sucker|
      arry << ConcatSQL.combine(sucker.attributes.values[1..12])
    end
#    binding.pry
    arry
  end

  def ConcatSQL.concat_entity(sucker)
    ConcatSQL.combine(sucker.attributes.values[1..12])
  end

  def ConcatSQL.name_concat
    name = @sucker_line_array.shift(5)
    name.reject { |i| i.empty? }.join(' ')
  end

  def ConcatSQL.phone_concat
    phone_array = @sucker_line_array.shift(4)
    phone_string = phone_array.reject { |i| i.empty? }.join('-')
    phone_string << ' ' + @sucker_line_array.shift
    phone_string
  end

  def ConcatSQL.twitter
    @sucker_line_array.shift
  end

  def ConcatSQL.email
    @sucker_line_array.shift
  end

  def ConcatSQL.combine(sucker_line_array)
    @sucker_line_array = sucker_line_array
    combined_array = []
    combined_array << name_concat
    combined_array << phone_concat
    combined_array << twitter
    combined_array << email
    combined_array
  end
end
