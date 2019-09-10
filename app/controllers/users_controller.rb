class UsersController < ApplicationController
    #what routs do I need for login? 

    #the purpose of this route is to render the login page (which is the login form)
    get '/login' do
        erb :login
    end

    # the purpose of this route is to receive the login form,
    #find the user, and log the user, and log the user in(create a session)
    post '/login' do
        #params look like: {email: "user@user.com", password: "password"}
        #creating a session which is actually adding a key value pair to the sessions hash
        #find the user
        @user=User.find_by(email: params[:email])
        #Autenticate the user = verify the user is whot hey say tehy are
        #they have the credentials - email/password combo
        if @user.authenticate(params[:password])
        #log the user in - create the user session
            session[:user_id] = @user.id #actually logging the user in
            # redirect to the user's landing page (show? index? dashboard?)
            puts session
            redirect "users/#{@user.id}"
        else 
            #tell the user they entered invalid credentials
            #redirect them to the login page
        end

    end

    get '/signup' do
    
    end

    get '/users/:id' do
        "this will be the user show route"
    end


end 