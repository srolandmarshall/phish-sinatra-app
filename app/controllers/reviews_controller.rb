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

  get '/reviews/:id/edit' do
    @review = Review.find_by(id:params[:id])
    erb :'reviews/edit'
  end

  post '/reviews/:id/edit' do
    @review = Review.find_by(id:params[:id])
    @review.update(text: params[:review])
    redirect '/reviews'
  end

  get '/reviews/:id/delete' do
    Review.find_by(id:params[:id]).destroy
    redirect '/reviews'
  end

end
