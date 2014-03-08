require 'minitest/autorun'
require_relative 'spec_helper'
require 'pry'

#Tests for steps in CC-07, pulling suckers from CSV file.
describe 'csv' do
  it 'should open the CSV file'
    get '/suckers'
end

def create_test_file
  test = CSV.new("testfile")
  testarray = ["", "Rae", "X.", "Roob", "MD","", "626", "343", "4393", "461", "Auer", "cale@franeckivandervort.com"]
  test.generate_line(testarray)
test
end

