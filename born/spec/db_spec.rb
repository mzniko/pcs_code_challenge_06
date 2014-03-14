require 'minitest/autorun'
require_relative 'spec_helper'
require 'pry'

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
end

before do
  @s = Sucker.new({ name: 'John Framblberg', email: 'john@Framblberg.com', twitter: '@Framblberg', phone: '123-456-7890' })
  @s.name = @s[:name]
  @s.phone = @s[:phone]
  @s.twitter = @s[:twitter]
  @s.email = @s[:email]
end
binding.pry

# class PostTests < MiniTest::Unit::TestCase
#   include Rack::Test::Methods
describe 'posting' do
  it 'should parse and save name' do
    assert @s.name.equal(['', 'John', '', 'Framblberg', ''])
    #give name field input and assert it equals parsed name
  end

  it 'should parse and save email' do
    #give email field input and assert it equals parsed email
  end

  it 'should parse and save twitter' do
    #give twitter field input and assert it equals parsed twitter
  end

  it 'should parse and save phone' do
    #give phone field input and assert it equals parsed phone
  end
end

describe 'retrieve' do

end
