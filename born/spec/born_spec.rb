require 'minitest/autorun'
require_relative 'spec_helper'

describe 'index' do

  # it 'should render the index with a correct template and layout' do
  #   get :index
  #   assert_template :index
  #   assert_template layout: 'layouts/application'
  # end

  it 'should have a title that says, Born Every Minute' do
    get :index
    assert_equal 'Born Every Minute', last_response.title
  end
end
