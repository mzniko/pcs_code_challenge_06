require 'sinatra'
require 'pry'

get '/' do
  erb :index
end

post '/thanks' do
  @name = params[:name]
  erb :thanks, locals: {nm: @name}
end

get '/suckers' do
  erb :suckers
end
