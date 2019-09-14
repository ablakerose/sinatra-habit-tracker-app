class HabitEntriesController < ApplicationController

    #get habit_entries/new to render a form to create new entry
    get '/habit_entries/new' do
        erb :'/journal_entries/new'
    end

    post '/habit_entries/new' do
        #I want to create a new habit entry and save it to the database
        #BUT I only want to save a habit if it has some content
        # I also only want to create a habit entry if a user is logged in
        if !logged_in?
            redirect '/'
        end

        if params[:content] !=""
            #create a new habit_entry
            @habit_entry = HabitEntry.create(habit_content: params[:habit_content], user_id: current_user.id)
            redirect '/habit_entries/#{@habit_entry.id}'
        else
            redirect '/habit_entries/new'
        end
    end
    # post journal_entries to create a new journal entry
    # how route for habit entry
    # index route for all habit entries

    get '/habit_entries/:id' do 
        @habit_entry = HabitEntry.find)params[:id])
    end
    

end

