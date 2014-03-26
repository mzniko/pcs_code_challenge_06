require 'data_mapper'

# progress indicator stuff
cr = "\r"
clear = "\e[0K"
reset = cr + clear
record_count = 1

# DataMapper stuff
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/suckers.sqlite3")

# these properties exactly match the column headers in the CSV file
# defines Sucker entities for sqlite3
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
SuckerEntity.auto_upgrade!

CSV.foreach('people.csv', headers: true) do |row|
  s = SuckerEntity.new(row)
  s.save

  # indicate progress
  print "#{reset}records: #{record_count}"
  $stdout.flush
  record_count += 1
end
