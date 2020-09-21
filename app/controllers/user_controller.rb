class UserController < ApplicationController

   get '/users/signup' do
    #binding.pry 
    erb :'users/signup'
   end


   post '/users/signup' do
    
    @user = User.create(username: params[:username], password: params[:password])
    redirect "/users/#{@user.id}"

   end

   get '/users/:id' do 

    @user = User.find(params[:id])
    #binding.pry
    erb :'users/show'
    
   end
end