require 'sinatra'
require 'pry'

get '/' do
  erb :index
end

post '/thanks' do
  @name = params[:post]["name"]
  erb :thanks, locals: {nm: @name}
end
