class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      @user = User.find_by(session[:id])
      erb :'games/games'
    else
      redirect to '/login'
    end
  end

end