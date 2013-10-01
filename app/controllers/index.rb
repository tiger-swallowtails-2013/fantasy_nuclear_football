$LOAD_PATH.unshift(File.expand_path('.'))


require 'config/main'

enable :sessions

get '/' do
  erb :index
end

get '/auth/facebook/callback' do
  session[:user_id] = User.find_or_create_by(:facebook_id => auth_hash[:uid]).id
  p session

  "Create User with facebook Id of #{auth_hash[:uid]}"



end

helpers do
  def auth_hash
    env['omniauth.auth']
  end

  def current_user
    @user = @user || User.find(session[:user_id])
  end
end
