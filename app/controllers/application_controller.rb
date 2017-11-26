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

  #tours

  get '/tours' do
    if logged_in?
      erb :'tours/tours'
    else
      redirect '/login'
    end
  end



end
