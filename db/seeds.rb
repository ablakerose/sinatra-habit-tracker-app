# here is where I will create some seed data to work with and test associations

# Create 2 users

HabitEntry.destroy_all
User.destroy_all

blake = User.create(name: "Blake", email: "blake@blake.com", password: "password")
liz = User.create(name: "Liz", email: "liz@blake.com", password: "password") 

#create some habit entries

HabitEntry.create(title: "TESTING TITLE1", habit_content: "Drink 8 glasses of water.", user_id: blake.id)

#Use ActiveRecord to pre-associate data:

blake.habit_entries.create(title: "TESTING TITLE2", habit_content: "Run 3 miles")

lizs_habit = liz.habit_entries.build(title: "TESTING TITLE3", habit_content: "Meditate for 10 minutes.")

#build instantiates an object that comes populated with a foreign key. If Liz ends up with a user_id of 2, this will have a user_id of 2
#lizs_habit.save


#see if everything worked the way I want it to by using gem tux