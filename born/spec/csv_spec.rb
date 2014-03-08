require 'csv'
require 'minitest/autorun'
require_relative 'spec_helper'
require 'pry'

#Tests for steps in CC-07, pulling suckers from CSV file.
describe 'csv' do
  it 'should open the CSV file'
    create_test_file
    get '/suckers'
    assert last_response.body.include?('Roob')
end

def create_test_file
  CSV.open("testfile.csv", 'w') do |test|
    test << ["", "Rae", "X.", "Roob", "MD","", "626", "343", "4393", "461", "Auer", "cale@franeckivandervort.com"]
  end
end
