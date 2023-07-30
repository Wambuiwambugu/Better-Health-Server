# Better Health Server
The project ia a digital prescription management web app for patients who would like to keep a recotd of their prescriptions, when they were taken, and record any side effects observed for each prescription medication.
## Front end interface
Find the React front app here [Better-Health React Client](https://github.com/Wambuiwambugu/Better-Health-React-Client)

## Technologies used
#### Ruby
#### Sinatra
#### Active Records
#### SQLite3

## Installation and Setup
Fork this repository and clone this repository

#### bundle install
To install all required dependancies
#### bundle exec rake  db:migrate db:seed
To create migrations and seed your data
#### bundle exec rake server
To start your backend server on port 9292

## Functionality
This api provides routes that allow a user to cteate or delete prescriptions,comments,and reminder notifications

## API calls you can make with this  API
##### GET all users
##### GET individual user with their associated prescriptions,comments and reminders
##### CREATE new user
##### CREATE new prescriptions
##### CREATE new comment
##### DELETE a prescription together with associated comments and reminders
##### DELETE a comment, and  a reminder

