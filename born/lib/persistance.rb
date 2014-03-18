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
