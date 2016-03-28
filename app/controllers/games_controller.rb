class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      @user = User.find_by(session[:id])
      erb :'games/games'
    else
      redirect to "/login"
    end
  end

  get '/games/new' do
    redirect to "/login" if !logged_in? 
    erb :'games/new'
  end

  post '/games' do
    redirect to "/games/new" if empty_field?
    @user = User.find_by(session[:id])
    binding.pry 
    @game = Game.find_or_create_by(params)
    @user.games << @game
    redirect to "/games/#{@game.slug}"
  end

  get '/games/:slug' do
    redirect to "/login" if !logged_in?
    @game = Game.find_by_slug(params[:slug])
    binding.pry 
    erb :'/games/show'
  end



end