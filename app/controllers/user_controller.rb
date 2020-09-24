class UserController < ApplicationController



    #User can sign up

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do 
       # binding.pry
        @user = User.new(params)
        if @user.save
            session[:user_id]= @user.id
            redirect  '/linetrackers'
        elsif User.find_by(username: @user.username)
            @er = "Account already exist."
            redirect '/signup'    
        else
            @error = "Username and password can not be blank."
             redirect '/signup' 
        end
    end

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



end