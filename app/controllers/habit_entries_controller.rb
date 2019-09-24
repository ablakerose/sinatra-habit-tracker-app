class HabitEntriesController < ApplicationController

    get '/habit_entries' do
        @habit_entries = HabitEntry.all
        erb :'habit_entries/index'
    end
 
    get '/habit_entries/new' do 
        erb :'habit_entries/new'
    end

    post '/habit_entries' do
        redirect_if_not_logged_in
        if params[:title] != "" && params[:content] != ""
            @habit_entry = HabitEntry.create(habit_content: params[:content], user_id: current_user.id, title: params[:title], completed_habit: params[:completed],  date_to_do_habit: params[:date_to_do_habit])
            flash[:message] = "Your habit entry has been saved!" if @habit_entry.id
             redirect "/habit_entries/#{@habit_entry.id}" 
        else
            flash[:errors] = "It appears you have not given your habit a title or filled in your explanation. Please try again."
            redirect '/habit_entries/new'
        end
    end
 
    get '/habit_entries/:id' do
        set_habit_entry
        erb :'habit_entries/show'
    end

    get '/habit_entries/:id/edit' do
        set_habit_entry
        redirect_if_not_logged_in
        if authorized_to_edit?(@habit_entry)
            erb :'habit_entries/edit'
        else 
            redirect "users/#{current_user.id}"
        end
    end

    patch '/habit_entries/:id' do
       set_habit_entry
       redirect_if_not_logged_in
            if @habit_entry.user == current_user && params[:habit_content] !=""
                @habit_entry.update(habit_content: params[:content], title: params[:title], completed_habit: params[:completed], date_to_do_habit: params[:date_to_do_habit])
                redirect "/habit_entries/#{@habit_entry.id}"
            else
                redirect "users/#{current_user.id}"
            end
    end
   
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
end

