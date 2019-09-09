class CreateHabitEntries < ActiveRecord::Migration
  def change
    create_table :habit_entries do |t|
      t.string :habit_content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end


