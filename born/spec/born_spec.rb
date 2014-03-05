require 'minitest/autorun'
require_relative 'spec_helper'

describe 'index' do

  it 'should render the index with a correct template and layout' do
    get '/'
    assert_equal 'layout', last_response.header
  end

  it 'should have a title that says, Born Every Minute' do
    get '/'
    assert last_response.body.include?('<title>Born Every Minute</title>')

  end
end
