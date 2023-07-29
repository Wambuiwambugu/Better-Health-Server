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

  

  post '/signup' do
    user = User.create(
      name: params[:name],
      email_address: params[:email_address],
      password: params[:password]
    )
    user.to_json

  end

  delete '/prescriptions/:id' do
    prescription = Prescription.find(params[id])
    prescription.destroy 
    prescription.to_json
  end


end
