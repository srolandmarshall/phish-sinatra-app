class ShowController < ApplicationController
  #shows
  get '/shows' do
    @reviews = Review.all
    erb :'shows/index'
  end

  # post '/shows' do
  #
  # end



end
