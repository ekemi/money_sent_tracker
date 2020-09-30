class UserController < ApplicationController



    #User can sign up

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do 
        @user = User.new(params)
        if @user.save
            session[:user_id]= @user.id
            redirect  '/linetrackers'
        elsif User.find_by(username: @user.username)
            @error = "Account already exist."
            redirect '/signup'    
        else
            @error = "Username and password can not be blank."
             redirect '/signup' 
        end
    end



end