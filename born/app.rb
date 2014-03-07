require 'sinatra'
require 'pry'

before do
  @info = {}
  @info[1] = ['pedobear', 'pedo@bearmail.com', '@twitter', '123-456-7890']
  @info[2] = ['pedo2', 'pedo@bearmail.com', '@twitter', '123-456-7890']
end

get '/' do
  erb :index
end

post '/thanks' do
  @name = params[:name]
  erb :thanks, locals: { nm: @name }
end

get '/suckers' do
  erb :suckers, locals: { info: @info }
end

get '/suckers/:num' do |number|
  deets = @info[number.to_i]
  # binding.pry
  erb :suckers_detail, locals: { info: deets }
end
