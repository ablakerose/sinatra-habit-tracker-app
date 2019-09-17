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

# purpose of migrations

Migrations build the data base and the structure of the database; in other words create the tables. The migration tells active record and sqlite to include and here are the columns to put in those types. 

# ActiveRecord::Base
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

#route variable
that is the ':id'. It's like whatever comes after the slash is a route variable called 'id' that is put somewhere in the form of a hash (params). When a user submits data in an application through route variables or forms, all the data is stored in a hash params that is part of Rack.
:id is a URL variable 
query strings ?name=avi (this also goes in the params hash. The query is the "?" then the key is name and value is avi

#Gems to USE ActiveRecord
(1) Activerecord gem: gives us access to the magical database mapping and association powers
(2) The rake gem, short for "ruby make", is a package that lets us quickly create files and folders, and automate tasks such as database creation; we define these in a file called Rakefile (create database, create a migration, etc.)
(3) Sinatra-activerecord gem gives us access to some awesome Rake tasks. 
#Gems: additional
(4) sqlite3 is our database adapter gem - it's what allows our Ruby application to communicate with a SQL database
(5) tux: give us an interactive console that pre-loads our database and ActiveRecord relationships for us

#CRUD
Create: implemented in Sinatra by building a route, or controller action, to render a form for creating a new instance of your model.

Read:  two ways in which we can read data. We may want to "read" or deliver to our user, all of the instances of a class, or a specific instance of a class
(get / models --> index.erb OR get / models/:id --> show.erb)

Update: need a controller action that renders an update form, and we need a controller action to catch the post request sent by that form
(get / edit --> edit.erb (form below) --> patch / :id)
<form action="/models/<%= @model.id %>" method="post">
    <input id="hidden" type="hidden" name="_method" value="patch">
    <input type="text" ...>
</form>

delete: It doesn't get its own view page but instead is implemented via a "delete button" on the show page of a given instance. This "delete button", however, isn't really a button; it's a form! The form should send a DELETE request to delete '/models/:id/delete' and should contain only a "submit" button with a value of "delete". That way, it will appear as only a button to the user.
(get /:id --> show.erb --> post / delete )
<form method="post" action="/models/<%= @model.id %>/delete">
  <input id="hidden" type="hidden" name="_method" value="DELETE">
  <input type="submit" value="delete">
</form>

#Logging in
The action of logging in is the simple action of storing a user's ID in the session hash

#Logging Out
This means terminating the period of interaction between a given user and our app. The action of 'logging out' is really just the action of clearing all of the data, including the user's ID, from the session hash. Luckily for us, there is already a Ruby method for emptying a hash: #clear.

#sessions off: sinatra is not issuing the browser a cookie

# rack 
defaults to "get" and "post" so to do a patch or delete request, we need the override code