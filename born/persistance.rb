require 'pry'
require 'data_mapper'

# makes suckers happen
class SuckerEntity
  include DataMapper::Resource

  property :id,             Serial
  property :name_prefix,    String
  property :first_name,     String
  property :middle_name,    String
  property :last_name,      String
  property :suffix,         String
  property :country_code,   String
  property :area_code,      String
  property :phone_prefix,   String
  property :line,           String
  property :extension,      String
  property :twitter,        String
  property :email,          String
  property :created_at,     DateTime
end

DataMapper.finalize
#DataMapper.auto_upgrade!

  # def suckers_display
  #   display = []
  #   CSV.foreach('people.csv') do |line|
  #     new_sucker = ConcatCsv.new(line).combine
  #     display << new_sucker
  #   end
  #   display
  # end

  # def goto(line)
  #   csv_line = CSV.readlines('people.csv')[line]
  #   ConcatCsv.new(csv_line).combine
  # end
