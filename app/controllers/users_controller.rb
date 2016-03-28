class UsersController < ApplicationController

  get '/' do 
    erb :'index'
  end

  get '/signup' do 
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.create(params)
    login
    redirect to "/games"
  end
end