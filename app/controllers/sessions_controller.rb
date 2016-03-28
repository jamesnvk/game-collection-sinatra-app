class SessionsController < ApplicationController

  get '/login' do
    redirect to '/games' if logged_in?
    erb :'users/login'
  end

  post '/login' do
    if empty_field?
      redirect to '/login'
    else
      @user = User.find_by(password: params[:password])
      login
      redirect to '/games'
    end
  end

  get '/logout' do
    logout
    redirect to "/"
  end
end