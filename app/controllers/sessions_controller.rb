class SessionsController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  get '/logout' do
    logout
    redirect to "/"
  end
end