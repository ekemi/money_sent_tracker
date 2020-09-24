class UserController < ApplicationController


#    #user can create an account
#    get '/signup' do
#     #binding.pry 
#     if !logged_in?
#       erb :'users/signup'

#     else
#       redirect '/linetrackers'
#    end
#   end


#    post '/signup' do

#     @user = User.new(username: params[:username], password: params[:password])
#     if @user.save
#       session[:suser_id]= @user.id
   
#       redirect '/linetrackers'

#     elsif User.find(username: params[:username])
#       @error ="Account with that Username already exits!"
#       erb :'/users/signup' 

#     else
#       @error = "Username and password can not be blank."
#       erb :'/users/signup' 
#     end 

#    end

#    get '/users/:id' do 

#     @user = User.find(params[:id])
#     #binding.pry
#     erb :'users/show'
    
#    end

   

#    #user can delete an account
# end
get '/users/new' do

  erb :'/users/new'
end

post'/users' do 
  @user = User.new(username: params[:username],password: [:password])
  if @user.save
    session[:user_id] = @user.id
    redirect '/linetrackers/index'
  else
    erb :'users/new'  

  end
end



end