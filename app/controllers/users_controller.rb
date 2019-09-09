class UsersController < ApplicationController
    #what routs do I need for login? 

    #the purpose of this route is to render the login page (which is the login form)
    get '/login'
        erb :login
    end

    # the purpose of this route is to receive the login form,
    #find the user, and log the user, and log the user in(create a session)
    post '/login' do
        
        #creating a session which is actually adding a key value pair to the sessions hash
    end

    get '/signup' do
    end

end 