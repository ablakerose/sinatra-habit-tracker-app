class AddCompletedBooleanToHabitEntries < ActiveRecord::Migration
  def change
    add_column :habit_entries, :completed_habit, :boolean, default: false
  end
end
