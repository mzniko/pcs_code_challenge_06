require 'sinatra'
require 'pry'

before do
  @suckers = []
  @suckers << ['pedobear', 'pedo@bearmail.com', '@twitter', '123-456-7890']
  @suckers << ['pedo2', 'pedo@bearmail.com', '@twitter', '123-456-7890']
end

get '/' do
  erb :index
end

post '/thanks' do
  @name = params[:name]
  erb :thanks, locals: { nm: @name }
end

get '/suckers' do
  erb :suckers
end

get '/suckers/:num' do |number|
  deets = @suckers[number.to_i]
  # binding.pry
  erb :suckers_detail, locals: { info: deets }
end
