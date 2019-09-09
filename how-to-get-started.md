Habit Tracker App

# App Overview

I’m going to build a habit app, where the user will be able to list and track daily habits.

# User Stories

## As a user, I will be able to…
- Login, sign up and log out
- Create a habit to track
- See all my habits
- Edit my habit list
- Keep track of how often I do them
- Delete my habits


# Wireframing

## Models will be User and Habit List


## User

### Attributes

- name
- email
- Password (if I use bcrypt, this will be ‘password_digest’ in the db)

### Associations

has_many :habits



## Habits

### Attributes
- Frequency Completed
- user_id <— this will be a foreign key!
- date <- is this a stretch goal? >

### Associations

belongs_to :user

# MVP (minimum viable product)

Users can sign up, log in, log out, create habits, edit how often they’ve done the habit and view their own habits.

# Stretch Goals

- CSS make it look really nice
- Tests
- Include a join model
- Include a Journal model- users have different journals and a journal has many
- Users can choose to make their habits public or private
- Have good habits and bad habits. Try to avoid bad habits and do good habits— tracker gauge should be positive.
