require 'minitest/autorun'
require_relative 'spec_helper'
require 'pry'

describe 'index' do
  it 'should render the index' do
    get '/'
    assert last_response.ok?
  end

  it 'should have a title that says, Born Every Minute' do
    get '/'
    assert last_response.body.include?('<title>Born Every Minute</title>')
  end
end

describe 'thanks' do
  it 'should pull up the thanks page after a form submission' do
    post '/thanks'
    assert last_response.ok?
  end

  # it 'should contain form data' do
  #   post '/thanks', 'name' => 'pedobear', 'mail' => 'pedo@bearmail.com',
  #        'twitter' => '@pedobear', 'phone' => '123-456-7899'
  #   assert request.form_data?
  # end

  it 'should reflect the correct name on form submission' do
    post '/thanks', 'name' => 'pedobear'#, 'mail' => 'pedo@bearmail.com',
         #'twitter' => '@pedobear', 'phone' => '123-456-7899'
    assert last_response.body.include?('pedobear')
  end
end

describe 'suckers' do
  it 'should pull up the suckers page after a form submission' do
    get '/suckers'
    assert last_response.ok?
  end

  it 'should reflect the correct name and email of submitters' do
    get '/suckers'

    assert last_response.body.include?('pedobear')
    assert last_response.body.include?('pedo@bearmail.com')
  end
end

