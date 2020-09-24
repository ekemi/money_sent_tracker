class  SessionController < ApplicationController

  # users can log in
   get '/login' do
    erb :'/users/login'
   end
  
   post '/login' do
    #binding.pry
    user = User.find_by(username: params[:username])


    if user && user.authenticate(params[:password])
        #user.save
        session[:user_id]= user.id
        redirect '/linetrackers'

    elsif  params[:username].empty? || params[:password].empty? #!user.save
        @error = "Username and password can not be blank."
        erb :'/users/login'

    elsif User.find_by(username: params[:username])
        @error ="Account with that Username already exits!"
        erb :'/users/login' 
    else

        @error = "Account not found."
        erb :'/users/login'
    end
end

get '/logout' do
    session.clear
    redirect '/'

end 

end
  