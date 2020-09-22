class UserController < ApplicationController


   #user can create an account
   get '/signup' do
    #binding.pry 
    erb :'users/signup'
   end


   post '/signup' do
    
    user = User.create(username: params[:username], password: params[:password])
    if user.save
      session[user_id]= user.id
      redirect '/linetrackers'

    elsif User.find(username: params[:username])
      @error ="Account with that Username already exits!"
      erb :'/users/signup' 

    else
      @error = "Username and password can not be blank."
      erb :'/users/signup' 
    end 

   end

   get '/users/:id' do 

    @user = User.find(params[:id])
    #binding.pry
    erb :'users/show'
    
   end

   #user can delete an account
end