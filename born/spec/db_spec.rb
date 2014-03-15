require 'minitest/autorun'
require_relative 'spec_helper'
require 'pry'

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
end

class TestPost
  property #add all properties
end

TestPost.auto_update!

before do
  t = TestPost.new
  t.name = 'John Frambleberg' # check that this is correct, maybe change to array
  t.email = 'john@Frambleberg.com'
  t.twitter = '@Frambleberg'
  t.phone = '123-456-7890'
  t.save
  t2 = TestPost.last
end

describe 'posting' do
  it 'should post the name correctly' do
    assert t.name == 'John Frambleberg'
  end

  it 'should be the last entry' do
    assert t == t2
  end
end

after do
  t.destroy # verify syntax for data mapper
end

describe 'retrieve' do

end
