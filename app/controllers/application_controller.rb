require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_sinatra_habit_app"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do 
    def logged_in?
      !!current_user
      #references current user and returns a boolean to say whether there is a current user or not.
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
      #User.find_by is an active record method that's going to query the database.
      #Looks at the database and finds a user ID that matches the session hash. If someone is not logged
      #Current user would be assigned to nill and logged_in would be false. 
      #having the instance variable at the beginning of the "or" just means less queries to the DB
    end

    def authorized_to_edit?(habit_entry)
      habit_entry.user == current_user
      #returns true or false based on whether the user of the habit is the current user.
    end

# BUILD HELPER METHOD FOR REDIRECTING IF NOT LOGGED IN

  end


end
