class AddDateToDoHabitToHabitEntries < ActiveRecord::Migration
  def change
    add_column :habit_entries, :date_to_do_habit, :date
  end
end
