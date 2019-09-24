class UsersController < ApplicationController
    

    get '/login' do
        erb :login
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            puts session
            flash[:message] = "Welcome, #{@user.name}!"
            redirect "users/#{@user.id}"
        else 
            flash[:errors] = "I'm sorry, we do not recognize this username or password. Please sign up or try again."
            redirect '/login'
        end

    end

    get '/signup' do
        erb :signup 
    end

   
    post '/users' do 
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user.id
            flash[:message] = "You have successfully created an account, #{@user.name}! Welcome!"
            redirect "/users/#{@user.id}"
        else 
            flash[:errors] = "Uh oh! #{@user.errors.full_messages.to_sentence}."
            redirect '/signup'
        end
    end

    get '/users/:id' do
        redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
        @sorted_entries = @user.habit_entries.sort_by &:date_to_do_habit
        erb :'/users/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end 


