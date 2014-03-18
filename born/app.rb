$LOAD_PATH << './lib'
require 'rubygems'
require 'sinatra'
require 'pry'
require 'data_mapper'
require 'suckersinput.rb'
require 'persistance.rb'
require 'concat_sql.rb'

enable :sessions

get '/' do
  erb :index
end

post '/suckers' do
  s = SuckerParse.new
  s.name = params[:name]
  s.phone = params[:phone]
  s.twitter = params[:twitter]
  s.email = params[:email]

  SuckerEntity.create(name_prefix: s.name[0],
                      first_name: s.name[1],
                      middle_name: s.name[2],
                      last_name: s.name[3],
                      suffix: s.name[4],
                      country_code: s.phone[0],
                      area_code: s.phone[1],
                      phone_prefix: s.phone[2],
                      line: s.phone[3],
                      extension: s.phone[4],
                      twitter: s.twitter[0],
                      email: s.email[0],
                      created_at: Time.now)

  session[:name] = params[:name]
  redirect to('/thanks')
end

get '/thanks' do
  # s = get_last_sucker
  @name = session[:name]
  erb :thanks, locals: { nm: @name }
end

get '/suckers' do
  @suckers = SuckerEntity.all.reverse
  session[:suckers_array] = ConcatSQL.concat_entities(@suckers)
  erb :suckers, locals: { suck: session[:suckers_array] }
end

get '/suckers/:num' do |number|
  deets = SuckerEntity.get(number.to_i + 1)
  deets = ConcatSQL.concat_entity(deets)
  erb :suckers_detail, locals: { info: deets }
end
