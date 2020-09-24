class LinetrackerController < ApplicationController

    #create
 get '/linetrackers/new' do
    
        erb :'linetrackers/new' 
    end

    post '/linetrackers' do
      
     linetracker = Linetracker.new(params)
     if linetracker.save
        redirect '/linetrackers'
     else 
        @error =  "Please try again!"
        erb :'/linetrackers/new'   
     end
    end

#     #read

  get '/linetrackers' do
     @user = User.find(session[:user_id])
     #if @User
        @linetrackers = Linetracker.all.reverse
        erb :'linetrackers/index'
#      else
#         redirect '/login'    
#    end
end

    get '/linetrackers/:id' do 
        id = params[:id]
        @linetracker = Linetracker.find_by(id: id)
        erb :'/linetrackers/show'
    end


    #update

    get '/linetrackers/:id/edit' do

            id = params[:id]
            @linetracker = Linetracker.find_by(id: id)
            if session[:user_id] == @linetracker.user_id
                erb :'linetrackers/edit'
        end

    end


    patch '/linetrackers/:id' do
        #binding.pry
        @linetracker = Linetracker.find(params[:id])
        if !params["linetracker"]["name"].empty? && !params["linetracker"]["country"].empty? && !params["linetracker"]["currency"].empty?&& !params["linetracker"]["amount"].empty?&& !params["linetracker"]["date"].empty?&& !params["linetracker"]["time"].empty?
            @linetracker.update(params[:linetracker])
            redirect "/linetrackers/#{@linetracker.id}"
        else
            @error = "Invalid"
            erb :'linetrackers/edit'    
        end
    end

    #delete

    delete '/linetrackers/:id' do
       linetracker =Linetracker.find(params[:id])
       linetracker.destroy
       redirect '/linetrackers'

    end

end