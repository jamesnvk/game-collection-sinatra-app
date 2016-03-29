class UsersController < ApplicationController

  get '/' do
    redirect to "/games" if logged_in?
    erb :'index'
  end

  get '/signup' do
    redirect to "/games" if logged_in?
    erb :'users/signup'
  end

  post '/signup' do
    if empty_field?
      redirect to "/signup"
    else
      @user = User.create(params)
      login
      redirect to "/games"
    end
  end

  get '/users' do
    redirect to "/login" if !logged_in?
    erb :'users/users'
  end

  get '/users/:slug' do
    redirect to "/login" if !logged_in?
    @user = User.find(session[:id])
    erb :'users/show'
  end

end