require 'minitest/autorun'
require_relative 'spec_helper'
require 'pry'

#Tests for steps in CC-07, pulling suckers from CSV file.
describe 'csv' do 
  it 'should open the file'
    get '/suckers'
    
end