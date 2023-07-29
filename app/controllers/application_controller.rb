class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/users' do 
    users = User.all
    users.to_json
  end

  get '/users/:id' do 
    user = User.find(params[:id]) 
    user.to_json(include: {prescriptions: {include: [:comments, :reminders]}})
  end

  post '/users/login' do
    email_address = params[:email_address]
    password = params[:password]
    user = User.find_by(email_address: email_address,password: password)
    if user
      username = user.name
      response = {id: user.id, username: username}
      response.to_json
    else
      status 404
      response = { message: "Login unsuccessful! Please try again" }
      response.to_json
    end
  end

  

  post '/signup' do
    user = User.create(
      name: params[:name],
      email_address: params[:email_address],
      password: params[:password]
    )
    user.to_json

  end

  # post '/prescriptions' do
  # end

  delete '/prescriptions/:id' do
    prescription = Prescription.find(params[id])
    prescription.destroy 
    prescription.to_json
  end

  delete '/comments/:id' do
    comment = Comment.find(params[:id])
    comment.destroy
    comment.to_json
  end

  delete '/reminders/:id' do
    reminder = Reminder.find(params[:id])
    reminder.destroy
    reminder.to_json
  end

  


end
