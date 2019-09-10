require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_sinatra_habit_app"
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!current_user
    end

    current_user
      @current_user ||= User.find_by(id: session[:user_id])
      #User.find_by is an active record method that's going to query the database.
    end

  
  end


end
