# concatanates a csv line into a suckers array
module ConcatSQL
  def self.concat_entities(sucker_entities)
    suckers_arrays = []
    sucker_entities.each do |sucker|
      arry << ConcatSQL.combine(sucker.attributes.values[1..12])
    end
    suckers_arrays
  end

  def self.concat_entity(sucker)
    ConcatSQL.combine(sucker.attributes.values[1..12])
  end

  def self.name_concat
    name = @sucker_line_array.shift(5)
    name.reject { |i| i.empty? }.join(' ')
  end

  def self.phone_concat
    phone_array = @sucker_line_array.shift(4)
    phone_string = phone_array.reject { |i| i.empty? }.join('-')
    phone_string << ' ' + @sucker_line_array.shift
    phone_string
  end

  def self.twitter
    @sucker_line_array.shift
  end

  def self.email
    @sucker_line_array.shift
  end

  def self.combine(sucker_line_array)
    @sucker_line_array = sucker_line_array
    concatenated_array = []
    concatenated_array << name_concat
    concatenated_array << phone_concat
    concatenated_array << twitter
    concatenated_array << email
    concatenated_array
  end
end
