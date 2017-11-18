require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  #users

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/shows'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    if (params[:username] != "") && (params[:email] != "") && (params[:password] != "")
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect to '/shows'
    else
      redirect '/signup'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    @shows = @user.shows
    erb :'users/show'
  end

  #shows
  get '/shows' do
    erb :'shows/index'
  end

end
