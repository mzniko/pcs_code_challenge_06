require 'sinatra'
require 'pry'

get '/' do
  erb :index
end

before do
  @name = params[:post]["name"]
end

post '/thanks' do
  erb :thanks, locals: {nm: @name}
end
