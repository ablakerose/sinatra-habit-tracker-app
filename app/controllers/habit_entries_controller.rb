class HabitEntriesController < ApplicationController

    #get habit_entries/new to render a form to create new entry
    get '/habit_entries' do
        erb :'/journal_entries/new'
    end

    post '/habit_entries' do
        #I want to create a new habit entry and save it to the database
        #BUT I only want to save a habit if it has some content
        # I also only want to create a habit entry if a user is logged in
        if !logged_in?
            redirect '/'
        end

        if params[:content] !=""
            #create a new habit_entry
            @habit_entry = HabitEntry.create(habit_content: params[:habit_content], user_id: current_user.id)
            redirect "/habit_entries/#{habit_entry.id}"
        else
            redirect '/habit_entries/new'
        end
    end

    get '/habit_entries/:id' do
        @habit_entry = HabitEntry.find(params[:id])
        erb ':habit_entries/show'
    end

    #this route should send us to the habit_entries/edit.erb, whcih will
    #render an edit form
    get '/habit_entries/:id/edit' do
        set_journal_entry
        if logged_in?
            if @habit_entry.user == current_user
                erb :'habit_entries/edit'
            else 
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

        #This action's job is to... 
    patch '/habit_entries/:id' do
       #1. find the journal entry
       set_habit_entry
       if logged_in?
            if @habit_entry.user == current_user
                #2. update the journal entry
                @habit_entry.update(habit_content: params[:content])
                #3. redirect to the show page of whatever was just created or modified. 
                redirect "/habit_entries/#{@habit_entry.id}"
            else
                redirect "users/#{current_user.id}"
            end
        else 
            redirect '/' 
        end
    end
    #*** MAJOR PROBLEMS***
    #1. RIGHT NOW anyone can edit anyone else's habits bc nothing in the 2 routes from preventing users from modifying other user's data
    #2. ALSO, I CAN EDIT a habit entry to be blank
   

    private
    def set_habit_entry
        @habit_entry = HabitEntry.find(params[:id])
    end
    # post journal_entries to create a new journal entry
    # how route for habit entry
    # index route for all habit entries

    # get '/habit_entries/:id' do 
    #     @habit_entry = HabitEntry.find)params[:id])
        
    # end


end

