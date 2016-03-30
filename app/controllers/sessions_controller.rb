class SessionsController < ApplicationController

  get '/login' do
    redirect to "/games" if logged_in?
    erb :'users/login'
  end

  post '/login' do
    redirect to "/login" if empty_field?
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          login
          redirect to "/games"
        else
          flash[:error] = "Invalid username or password."
          redirect to "/login"
        end
  end

  get '/logout' do
    logout
    redirect to "/"
  end
end