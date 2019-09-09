class UsersController < ApplicationController
    #what routs do I need for login? 

    #the purpose of this route is to render the login page (which is the login form)
    get '/login'
        erb :login
    end

    get '/signup' do

end 