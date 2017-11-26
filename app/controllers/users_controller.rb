class UserController < ApplicationController
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

  post '/users/:id' do
    @user = User.find_by(id: params[:id])
    @show = Show.find_by(date_string: params[:show])
    @user.shows << @show if !@user.shows.exists?(id: @show.id)
    @user.save
    erb :'users/show'
  end
end
