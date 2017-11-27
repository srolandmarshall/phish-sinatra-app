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
      flash[:message] = "You need to be logged in to do this."
      redirect '/login'
    end
  end

  post '/add' do
    @years = Tour.unique_years
    @year = params[:year]
    @shows = Show.where(year: params[:year]).order(:date_string)
    @user = current_user
    erb :'reviews/add'
  end

  get '/reviews/:id/edit' do
    @review = Review.find_by(id:params[:id])
    if @review.user.id == current_user.id
      erb :'reviews/edit'
    elsif logged_in?
      flash[:message] = "You are not the owner of this review."
      redirect '/reviews'
    else
      flash[:message] = "You need to be logged in to do this."
      redirect '/login'
    end
  end

  post '/reviews/:id/edit' do
    @review = Review.find_by(id:params[:id])
    @review.update(text: params[:review])
    flash[:message] = "Review edited."
    redirect '/reviews'
  end

  get '/reviews/:id/delete' do
    @review = Review.find_by(id:params[:id])
    if @review.user.id == current_user.id
      @review.destroy
      flash[:message] = "Review deleted."
      redirect '/reviews'
    elsif logged_in?
      flash[:message] = "You are not the owner of this review."
      redirect '/reviews'
    else
      flash[:message] = "You need to be logged in to do this."
      redirect '/login'
    end
  end

end
