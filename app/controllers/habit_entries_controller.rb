class HabitEntriesController < ApplicationController

    #get habit_entries/new to render a form to create new entry
    get '/habit_entries' do
        @habit_entries = HabitEntry.all
        erb :'habit_entries/index'
    end
 
    get '/habit_entries/new' do 
        erb :'habit_entries/new'
    end

    post '/habit_entries' do
        #I want to create a new habit entry and save it to the database
        #BUT I only want to save a habit if it has some content
        # I also only want to create a habit entry if a user is logged in
        redirect_if_not_logged_in

        if params[:habit_content] != ""
            #create a new habit_entry
           
            @habit_entry = HabitEntry.create(habit_content: params[:habit_content], user_id: current_user.id, title: params[:title])
             flash[:message] = "Your habit entry has been saved!" if @habit_entry.id
             redirect "/habit_entries/#{@habit_entry.id}" 
        else
            flash[:errors] = "It appears you have not entered text. Please try again."
            redirect '/habit_entries/new'
        end
    end
 
    get '/habit_entries/:id' do
        @habit_entry = HabitEntry.find(params[:id])
        
        erb :'habit_entries/show'
    end

    #this route should send us to the habit_entries/edit.erb, which will
    #render an edit form
    get '/habit_entries/:id/edit' do
        set_habit_entry
        redirect_if_not_logged_in
        if authorized_to_edit?(@habit_entry)
            erb :'habit_entries/edit'
        else 
            redirect "users/#{current_user.id}"
        end
        
            #this needs to be a redirect because of separation of concerns. Whenever we build method or controller acitons 
            #need to be what the job of the action (delete action) is . The job of this action is to delete the journal entry. 
            #It does a quick check to amke sure it's allowed but it's not its job to SHOW us something. That's the job of the 
            #get request.
    end

        #This action's job is to... 
    patch '/habit_entries/:id' do
       #1. find the habit entry
       set_habit_entry
       redirect_if_not_logged_in
            if @habit_entry.user == current_user && params[:habit_content] !=""
                #2. update the habit entry
                @habit_entry.update(habit_content: params[:content])
                #3. redirect to the show page of whatever was just created or modified. 
                redirect "/habit_entries/#{@habit_entry.id}"
            else
                redirect "users/#{current_user.id}"
            end
    end
    #*** MAJOR PROBLEMS***
    #1. RIGHT NOW anyone can edit anyone else's habits bc nothing in the 2 routes from preventing users from modifying other user's data
    #2. ALSO, I CAN EDIT a habit entry to be blank
   
    delete '/habit_entries/:id' do
        set_habit_entry
        if authorized_to_edit?(@habit_entry)
            @habit_entry.destroy
            flash[:message] = "Your habit entry has been deleted."
            redirect '/habit_entries'
        else
            redirect '/habit_entries'
        end
    end


    private
    def set_habit_entry
        @habit_entry = HabitEntry.find(params[:id])
    end
    # post habit_entries to create a new habit entry
    # how route for habit entry
    # index route for all habit entries

    # get '/habit_entries/:id' do 
    #     @habit_entry = HabitEntry.find)params[:id])
    # end


end

