class UsersController < ApplicationController
    #what routes do I need for login? 

    #the purpose of this route is to render the login page (which is the login form)
    get '/login' do
        erb :login
    end

    # the purpose of this route is to receive the login form,
    #find the user and log the user in (create a session)
    post '/login' do
        #params look like: {email: "user@user.com", password: "password"}
        #creating a session which is actually adding a key value pair to the sessions hash
        #find the user
        @user = User.find_by(email: params[:email])
        #Autenticate the user = verify the user is whot hey say tehy are
        #they have the credentials - email/password combo
        if @user && @user.authenticate(params[:password])
        #log the user in - create the user session
            session[:user_id] = @user.id #actually logging the user in
            # redirect to the user's landing page (show? index? dashboard?)
            puts session
            flash[:message] = "Welcome, #{@user.name}!"
            redirect "users/#{@user.id}"
        else 
            flash[:errors] = "I'm sorry, we do not recognize this username or password. Please sign up or try again."
            #tell the user they entered invalid credentials
            #redirect them to the login page
            redirect '/login'
        end

    end
    
    # this route's job is to render the signup form
    get '/signup' do
        # erb (render) a view
        erb :signup 

    end

   
    post '/users' do 
#here is where we will create a new user and persist the new user to the DB
    
        # "name"=>"Blake"
        # "email"=>"blake@blake.com"
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id #actually logging the user in
            #above, this is mass-assignment
            #where do I go? one option is the user show page. 
            redirect "/users/#{@user.id}"
            #when we redirect
            #this is the dynamic part of the URL. The only place where we use the symbol of the URL is where we define it which is inside the controller. In rails you do it in a different file.
            #ERB, I'm looking for a path to the file. In application controller, I told sinatra that I'm putting views underneath the app folder in a folder called views, so that's what it's going to look for when I render wtih ERB.
            #whwen we redirect, we're writing in the URL of the request we're sending. the result is a brand new get request. 
            #the redirect is a better choice right now: 
            #(1) only what a get request when you want to get to a page
            #(2) separation of concerns
            #(3) access to instance variable
        else 
            #not valid input
            #it would be better to include a message to the user
            #tell them what is wrong (stretch goal)
            redirect '/signup'
        end

    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end 













# class UsersController < ApplicationController

 
#     get '/login' do
#       redirect_if_logged_in
#       erb :login
#     end
  
#     post '/login' do
#       @user = User.find_by(email: params[:email])
#       if @user && @user.authenticate(params[:password])
#         session[:user_id] = @user.id 
#         flash[:message] = "Welcome, #{@user.name}!"
#         redirect "users/#{@user.id}"
#       else
#         flash[:errors] = "Your credentials were invalid.  Please sign up or try again."
#         redirect '/login'
#       end
#     end
  
#     get '/signup' do
#       redirect_if_logged_in
#       erb :signup
#     end
  
#     post '/users' do
#           @user = User.new(params)
#         if @user.save
#         session[:user_id] = @user.id # actually logging the user in
#         flash[:message] = "You have successfully created an account, #{@user.name}! Welcome!"
#         redirect "/users/#{@user.id}"
#       else
#        flash[:errors] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
#         redirect '/signup'
#       end
#     end
  
#     get '/users/:id' do
#       @user = User.find_by(id: params[:id])
#       redirect_if_not_logged_in
  
#       erb :'/users/show'
#     end
  
#     get '/logout' do
#       session.clear
#       redirect '/'
#     end
  
#   end