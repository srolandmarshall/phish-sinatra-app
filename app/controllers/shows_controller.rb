class ShowController < ApplicationController
  #shows
  get '/shows' do
    erb :'shows/index'
  end

  # post '/shows' do
  #
  # end

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
