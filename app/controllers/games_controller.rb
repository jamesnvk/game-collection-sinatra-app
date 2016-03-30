class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      @user = User.find(session[:id])
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
    @user = User.find(session[:id])
    @game = Game.create(params)
    @user.games << @game
    redirect to "/games/#{@game.id}"
  end

  get '/games/:id' do
    redirect to "/login" if !logged_in?
    @user = User.find(session[:id])
    @game = Game.find(params[:id])
    erb :'/games/show'
  end

  get '/games/:id/edit' do
    redirect to "/login" if !logged_in?
    @user = User.find(session[:id])
    @game = Game.find(params[:id])
    if @game.user_id == @user.id
      erb :'/games/edit'
    else
      flash[:edit] = "Unable to edit other user's games"
      redirect to "/games/#{@game.id}"
    end 
  end

  patch '/games/:id' do
    @game = Game.find(params[:id]) 
      redirect to "games/#{@game.id}/edit" if empty_field?
    @game.title = params[:title]
    @game.year = params[:year]
    @game.save
    redirect to "games/#{@game.id}"
  end

  delete '/games/:id/delete' do
    @user = User.find(session[:id]) 
    @game = Game.find(params[:id])
    if @game.user_id == @user.id
      @game.destroy
      redirect to "/games"
    else
      flash[:delete] = "Unable to delete other user's games"
      redirect to "/games/#{@game.id}"
    end
  end



end