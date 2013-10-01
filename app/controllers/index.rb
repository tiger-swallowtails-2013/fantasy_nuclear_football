$LOAD_PATH.unshift(File.expand_path('.'))


require 'config/main'

enable :sessions

get '/' do
  erb :index
end

get '/auth/facebook/callback' do
  session[:user_id] = User.find_or_create_by(prepared_user_data).id
  "Create User with facebook Id of #{auth_hash[:uid]}"
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
    @user ||= User.find(session[:user_id])
  end
end
