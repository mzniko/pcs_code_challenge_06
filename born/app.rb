require 'sinatra'
require 'pry'
require 'csv'
require_relative 'suckersinput.rb'

enable :sessions

# before do
#   @suckers = []
#   @suckers << ['pedobear', 'pedo@bearmail.com', '@twitter', '123-456-7890']
#   @suckers << ['pedo2', 'pedo@bearmail.com', '@twitter', '123-456-7890']
# end

get '/' do
  erb :index
end

post '/suckers' do
  s = Sucker.new
  s.name = params[:name]
  s.phone = params[:phone]
  s.twitter = params[:twitter]
  s.email = params[:email]
  CSV.open('people.csv', 'a') do |f|
    f << s.csvstring
  end
  session[:name] = params[:name]
  redirect to('/thanks')
end

get '/thanks' do
  # s = get_last_sucker
  @name = session[:name]
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
