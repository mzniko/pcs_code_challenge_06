require 'sinatra'
require 'pry'

get '/' do
  erb :index
end

post '/thanks' do
  @name = params["name"]
  binding.pry
  erb :thanks
end
