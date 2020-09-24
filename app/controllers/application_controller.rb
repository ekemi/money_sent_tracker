require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get "/" do
  #   erb :welcome
  # end

get '/' do
  @linetrackers = Linetracker.all 
  erb :'linetrackers/index' 
end

  helpers do

    def current_user
      User.find(session[:user_id])
    end


    def logged_in?
      !!session[:user_id]
    end
  
    def if_not _logged_in
      if !logged_in?
        @error = "You have to log in to explore that page"
        redirect '/login'
      end

    end

  end


end

