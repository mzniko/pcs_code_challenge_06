require_relative 'app_test_helper.rb'
require 'data_mapper'
require 'pry'
require_relative '../lib/persistance.rb'

class MyTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    @params_hash = {
        name: 'Mrs. Theresa E. Stamm',
        email: 'kieran@runte.biz',
        phone: '1-678-523-6736',
        twitter: '@Reinger' }
  end

  def test_born
    get '/'
    assert last_response.ok?

    post '/suckers', @params_hash
    SuckerEntity.create(@params_hash[:sucker])
    assert last_response.redirect?

    # get '/suckers'
    # assert last_response.ok?

    # # get '/suckers/:id'
    # # assert last_response.ok?

    # get '/thanks'
    # assert last_response.ok?
  end

  # def test_sucker_added_to_database # rubocop:disable MethodLength
  #   current_count = SuckerEntity.count
  #   post '/suckers', @params_hash
  #   follow_redirect!
  #   assert_equal current_count + 1, SuckerEntity.count
  #   assert_equal 'Mrs.', SuckerEntity.last.prefix_name
  #   assert_equal 'Theresa', SuckerEntity.last.first_name
  #   assert_equal 'E.', SuckerEntity.last.middle_name
  #   assert_equal 'Stamm', SuckerEntity.last.last_name
  #   assert_equal '1', SuckerEntity.last.country_code
  #   assert_equal '678', SuckerEntity.last.area_code
  #   assert_equal '523', SuckerEntity.last.prefix_code
  #   assert_equal '6736', SuckerEntity.last.line
  #   assert_equal '', SuckerEntity.last.extension
  #   assert_equal 'Reinger', SuckerEntity.last.twitter
  #   assert_equal 'kieran@runte.biz', SuckerEntity.last.email
  # end

  # def test_suckers_on_suckers_page
  #   get '/suckers'
  #   assert last_response.body.include?('kieran@runte.biz')
  #   assert last_response.body.include?('Mrs. Theresa E. Stamm')
  # end

  # def test_not_a_sucker_on_suckers_page
  #   get '/suckers'
  #   refute last_response.body.include?('fake@email.com')
  # end

  # def test_single_sucker_on_specific_page
  #   get '/suckers/2'
  #   assert last_response.body.include?('Keara Maggio')
  #   assert last_response.ok?
  # end

  # def test_other_sucker_not_on_specific_page
  #   get '/suckers/2'
  #   refute last_response.body.include?('Mrs. Theresa E. Stamm')
  # end
end
