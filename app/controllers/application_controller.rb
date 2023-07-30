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

  post '/login' do
    email_address = params[:email_address]
    password = params[:password]
    user = User.find_by(email_address: email_address)
    if user && user.password == password
      response ={ id: user.id, name: user.name }
      response.to_json
    else
      status 404
      response ={ error: 'User not found.' }
      response.to_json
    end
  end

  

  post '/signup' do
    user = User.create(
      name: params[:name],
      email_address: params[:email_address],
      password: params[:password]
    )
    # r
    user.to_json
    

  end

  post '/prescriptions' do
    prescription = Prescription.create(
      name: params[:name],
      dosage: params[:dosage],
      duration: params[:duration],
      instructions: params[:instructions],
      user_id: params[:user_id]
    )
    prescription.to_json
  end

  patch '/prescription/:id' do
    prescription = Prescription.find(params[:id])
    prescription.update(
      dosage: params[:dosage],
      duration: params[:duration],
      instructions: params[:instructions]
    )
    prescription.to_json
  end

  post '/comments' do 
    comment = Comment.create(
      comment: params[:comment],
      prescription_id: params[:prescription_id]
    )
    comment.to_json
  end

  post '/reminders' do 
    reminder = Reminder.create(
      message: params[:reminder],
      prescription_id: params[:prescription_id]
    )
    comment.to_json
  end

  delete '/prescriptions/:id' do
    prescription = Prescription.find(params[id])
    prescription.comments.destroy_all
    prescription.reminders.destroy_all
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
