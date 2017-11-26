class UserController < ApplicationController
  #users

  get '/login' do
    if logged_in?
      redirect '/shows'
    else
      erb :'users/login'
    end
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
    if logged_in?
      redirect '/shows'
    else
      erb :'users/create_user'
    end
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
    @reviews = @user.reviews
    erb :'users/show'
  end

  post '/users/:id' do
    @user = User.find_by(id: params[:id])
    @show = Show.find_by(date_string: params[:show])
    if Review.find_by(show_id: @show.id, user_id: current_user.id) == nil
      @review = Review.create(show_id: @show.id, user_id: current_user.id, text: params[:review])
      @review.save
    end
    @user.save

    erb :'users/show'
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end

end
