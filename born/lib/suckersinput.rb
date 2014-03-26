# manages transfer of customer info from index form to db
class SuckerParse
  attr_reader :email, :twitter, :suffixes, :prefixes

  def initialize
    @suffixes = %w(Jr. Sr. II III IV PhD.)
    @prefixes = %w(M. Mrs. Mr. Dr. Ms. Sister Lady Miss)
  end

  def name=(name_string)
    @parsed_name = { pre: '', first: '', middle: '', last: '', suffix: '' }

    word = name_string.split
    @parsed_name[:suffix] = word.pop if @suffixes.include? word.last
    @parsed_name[:last] = word.last
    @parsed_name[:pre] = word.shift if @prefixes.include? word.first
    @parsed_name[:first] = word.shift if word.count > 1
    @parsed_name[:middle] = word.first if word.count > 1
  end

  def name
    @parsed_name.values
  end

  def email=(email_string)
    @email = []
    @email.push(email_string.match(/\S+@\S+\.\S+/) ? email_string : 'Not Found')
  end

  def twitter=(twit_string)
    @twitter = []

    @twitter << twit_string.gsub(/@/, '')
  end

  def phone=(phone_string)
    @parsed_phone = { country: '', area: '', prefix: '',
                      line: '', extension: '' }

    phone_string.gsub!(/\W/, ' ')
    phone = phone_string.split
    @parsed_phone[:extension] = phone.pop.sub(/x/, '') if phone_string.match(/x/)
    @parsed_phone[:line] = phone.pop unless phone.empty?
    @parsed_phone[:prefix] = phone.pop unless phone.empty?
    @parsed_phone[:area] = phone.pop unless phone.empty?
    @parsed_phone[:country] = phone.pop unless phone.empty?
  end

  def phone
    @parsed_phone.values
  end

  def csvstring
    @input = @parsed_name.values << @parsed_phone.values << @twitter << @email
    @input.flatten
  end
end
