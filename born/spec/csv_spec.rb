require 'csv'
require 'minitest/autorun'
require_relative 'spec_helper'
require 'pry'

def create_test_file
  CSV.open('testfile.csv', 'w') do |test|
    test << ['', 'Rae', 'X.', 'Roob', 'MD', '', '626', '343', '4393', '461', 'Auer', 'cale@franeckivandervort.com']
  end
end

before do
  create_test_file
end

after do
  File.delete('testfile.csv')
end

# Tests for steps in CC-07, pulling suckers from CSV file.
describe 'csv' do
  it 'should open the CSV file' do
    get '/suckers'
    assert_kind_of(CSV, @suckers_csv)
  end
end
