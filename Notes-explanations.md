# Corneal Gem
A generator for sinatra. 
Rails has generators where we can quickly and easily build files. This one is for Sinatra


# app folder
contains Models, Views and Controller

# config.ru
the file allows us to build this on top of rack.
require the environment and then run application controller
this is also where to mount other controllers with 'use'
In order to send PATCH and DELETE requests, will need to add line of code there. 
  use Rack::MethodOverride (this is to submit forms that arent' just get and post)

# git command turns folder into repository / initializes an empty repository in current working directory

git init

git add . == adds anything that's been saved in git status / add is talking about staging 

got remote add origin git@github.com.... 
(this line of code adds a remote respository, names the repository and tells git where it lives)

git push -u origin master
push is what pushes all my changes up to the git repository
origin master is what we tell it where to push it.

#purpose of migrations

Migrations build the data base and the structure of the database; in other words create the tables. The migration tells active record and sqlite to include and here are the columns to put in those types. 

#ActiveRecord::Base
User Model inherits from this gem that is being used as an Objection Relational Mapper throughout this project

Base is the "Class" in the ActiveRecord module 

#Rake
this is a way to use the command line to create Ruby code wtihout having to run it manually rake -T

#has_secure_password
have access to this because of bcrypt and it allows us to use an active record method called "authenticate" which takes a password as a plane string and checks it against authenticates hash.

#git commit language
imagine I'm talking to my project manager. "If you accept this commit, it will... " and then I finish that sentence.

#t.timestamps null: false
automatically gives timestamps whenever create or change a model.

#breaking up git commits (video 1 time 50 mins)

#What Is Tux
Tux is an incredible Ruby gem that lets you access your database and perform all CRUD operations on it through the terminal. It also loads a full environment in the console that allows you to see all routes and views. Primarily, you'll use Tux to make sure your database is set up properly, play around with Ruby objects, and make sure your ActiveRecord associations are working properly.

#CONTROLLERS AND INHERITANCE
All controllers inherit from Application Controller because that gives all controllers any applications that are built in the application controller.

#params
the container/vehicle that is passed in by the user. Its a hash. Like a bus that goes back and forth from the views to the controllers. The passengers are the emails and carries

#FORMS
within a form, the "class" refers to a CSS class; the "action" refers to route of the controller we want to navigate to once it's subtmitted.

#rendering
rarely are we going to render from a post, patch or delete request. rendering should happen from a get request.

#redirect
when we redirect, we're sending a brand new get request. And when that happens, all variables created within that particular controller route/ action get annihilated and are gone. Redirects destroy instance variables. If we want an instance variable to live on, we can ERB (which calls the render method)

git commit -m 'add habit entries controller'
git commit -m 'mount habit entries controller'
git commit -m 'add views habit journal entries folder'
git commit -m 'add link to new habit entry page'
git commit -m 'add post entries, add new form, update spec.md'
