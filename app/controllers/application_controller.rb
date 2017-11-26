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

  #shows
  get '/shows' do
    erb :'shows/index'
  end

  get '/addshow' do
    @years = []
    Tour.all.each {|t| @years << t.year}
    @years.uniq!
    @user = current_user
    if logged_in?
      erb :'shows/add'
    else
      redirect '/login'
    end
  end

  post '/addshow' do
    @years = []
    Tour.all.each {|t| @years << t.year}
    @years.uniq!
    @year = params[:year]
    @shows = Show.where(year: params[:year])
    @user = current_user
    erb :'shows/add'
  end

end
