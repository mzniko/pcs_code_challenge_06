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
  @info = {}
  @info[:one] = ['pedobear', 'pedo@bearmail.com']
  @info[:two] = ['pedo2', 'pedo@bearmail.com']
  erb :suckers, locals: {info: @info}
end
