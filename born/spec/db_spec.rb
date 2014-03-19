require 'minitest/autorun'
require_relative 'spec_helper'
require 'pry'
require 'rake/testtask'
require 'data_mapper'
require_relative '../lib/suckersinput.rb'

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

SuckerEntity.auto_upgrade!


class BornSpec < MiniTest::Spec
  describe 'input' do
    @test_input_entity = { name: 'John Frambleberg',
                      phone: '123-456-7890',
                      twitter: '@Frambleberg',
                      email: 'john@Frambleberg.com'}

    @sucker_input_entity = SuckerParse.new
    @sucker_input_entity.name = @test_input_entity[:name]
    @sucker_input_entity.phone = @test_input_entity[:phone]
    @sucker_input_entity.twitter = @test_input_entity[:twitter]
    @sucker_input_entity.email = @test_input_entity[:email]

    it 'should parse an input' do
      expectation = @test_input_entity.values
      assert expectation[0] == @sucker_input_entity.name
      assert expectation[1] == @sucker_input_entity.phone
      assert expectation[2] == @sucker_input_entity.twitter
      assert expectation[3] == @sucker_input_entity.email
    end
  end

  describe 'posting' do
    @test_db_entity = SuckerEntity.create(name_prefix: '' ,
                                      first_name: 'John',
                                      middle_name: '',
                                      last_name: 'Frambleberg',
                                      suffix: '',
                                      country_code: '',
                                      area_code: '123',
                                      phone_prefix: '456',
                                      line: '7890',
                                      extension: '',
                                      twitter: '@Frambleberg',
                                      email: 'john@Frambleberg.com',
                                      created_at: Time.now)

    @test_entity_tester = SuckerEntity.last

    it 'should save the name correctly' do
      assert @test_db_entity.get(:first_name) == 'John'
    end

    it 'should be the last entry' do
      assert @test_db_entity == @test_entity_tester
    end
  end

  after do
    @test_db_entity.destroy
  end

  # describe 'retrieve' do

  # end
end
