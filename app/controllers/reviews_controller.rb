class ReviewController < ApplicationController

  get '/reviews' do
    @reviews = Review.all
    erb :'reviews/index'
  end

  get '/add' do
    @years = Tour.unique_years
    @user = current_user
    if logged_in?
      erb :'reviews/add'
    else
      redirect '/login'
    end
  end

  post '/add' do
    @years = Tour.unique_years
    @year = params[:year]
    @shows = Show.where(year: params[:year])
    @user = current_user
    erb :'reviews/add'
  end

end
