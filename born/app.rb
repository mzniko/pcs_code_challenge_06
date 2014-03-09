require 'sinatra'
require 'pry'
require 'csv'
require_relative 'suckersinput.rb'
require_relative 'persistance.rb'

enable :sessions

before do
  suckers = SuckerList.new
  @suckers = suckers.suckers_display.to_a
end

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
  session[:suckers_array] = @suckers
  erb :suckers, locals: {suck: @suckers}
end

get '/suckers/:num' do |number|
  deets = SuckerList.new.goto(number.to_i)
  # binding.pry
  erb :suckers_detail, locals: { info: deets }
end
