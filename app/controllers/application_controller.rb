require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "games"
    register Sinatra::Flash
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def login
      session[:id] = @user.id
    end

    def logout
      session.clear
    end

    def empty_field?
      params.has_value?("")
    end
  end



end