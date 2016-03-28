class UsersController < ApplicationController

  get '/' do 
    erb :'index'
  end

  get '/signup' do
    redirect to '/games' if logged_in?
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
end