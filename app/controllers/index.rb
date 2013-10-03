$LOAD_PATH.unshift(File.expand_path('.'))

require 'config/main'
require "sinatra/json"

enable :sessions

get '/' do
  @all_users = User.all
  erb :index
end

get '/teams/:id.json' do
  @queried_team = Team.find(params[:id])
  json @queried_team
end

get '/teams/:id' do
  @queried_team = Team.find(params[:id])
  erb :team
end

get '/users/:id' do
  @queried_user = User.find(params[:id])
  erb :user
end

get '/auth/facebook/callback' do
  session[:user_id] = User.find_or_create_by(prepared_user_data).id
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/politicians/search' do
  politicos = Politician.where('first_name=?',params[:pol_name].capitalize)
  .map{|p| "#{p.first_name} #{p.last_name}"}
  json politicos
end

helpers do
  def prepared_user_data
    {
      :facebook_id => auth_hash[:uid],
      :email => auth_hash[:info][:email],
      :username => auth_hash[:info][:nickname],
      :firstname => auth_hash[:info][:first_name],
      :lastname => auth_hash[:info][:last_name]
    }
  end

  def auth_hash
    env['omniauth.auth']
  end

  def current_user
    if session[:user_id]
      @user ||= User.find(session[:user_id])
    else
      nil
    end
  end
end
