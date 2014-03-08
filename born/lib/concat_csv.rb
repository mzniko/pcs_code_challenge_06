# concatanates a csv line into a suckers array
class ConcatCsv
  def initialize(csv_line_array)
    @csv_line_array = csv_line_array
  end

  def name_concat
    name = @csv_line_array.shift(5)
    name.reject {|i| i.empty?}.join(" ")
  end

  def phone_concat
    phone_array = @csv_line_array.shift(4)
    phone_string = phone_array.reject {|i| i.empty?}.join("-")
    phone_string << " " + @csv_line_array.shift
    phone_string
  end

  def twitter
    @csv_line_array.shift
  end

  def email
    @csv_line_array.shift
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
