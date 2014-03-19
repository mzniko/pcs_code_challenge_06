require 'data_mapper'

configure do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/suckers.sqlite3")
end

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
DataMapper.auto_upgrade!

# database utilities
module DButils
  def self.merge_csv
    # for each row in the file, make an object and store it in the database.
    suckers = CSV.foreach('people.csv', headers:true) do |row|
      s = Sucker.new(row) # this is all it takes because we use the headers.
      s.save

      # indicate progress
      print "#{reset}records: #{record_count}"
      $stdout.flush
      record_count +=1
    end
  end
end
