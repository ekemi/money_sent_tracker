class LinetrackerController < ApplicationController

    
    
    #Create

    get '/linetrackers/new' do
        #user = User.find_by(id: session[:user_id])
        if loggin_in?#user
            erb :'/linetrackers/new'
        else
            @error = "Data invalid. Please try again."
            erb  :'/login'
        end 

    end

    post '/linetrackers' do
       linetracker = current_user.linetrackers.build(params) #linetracker = Linetracker.new(params)
        if linetracker.save #!linetracker.name.empty? && !linetracker.country.empty?&& !linetracker.currency.empty?&& !linetracker.date.empty?&& !linetracker.amount.empty?&& !linetracker.time.empty?
            linetracker.save
            redirect '/linetrackers'
        else
            @error = "Data invalid. Please try again."
            erb  :'/linetrackers/new'
        end  
    end
    
    
    #Read

    get '/linetrackers' do
       
        #user = User.find_by(id: session[:user_id])
        if  loggin_in?#user
           @linetrackers = Linetracker.all.reverse
           erb :'linetrackers/index'
        else
            @linetracker_all_error= "You have to log in to view that page"
            redirect '/login'
        end
    end

    get '/linetrackers/:id' do 
        #user = User.find_by(id: session[:user_id])
        if  loggin_in?#user
            @linetracker = Linetracker.find(params[:id])
            erb :'/linetrackers/show'
        else
            @linetracker_all_error= "You have to log in to view that page"
            redirect '/login'
        end

    end


    #update

    get '/linetrackers/:id/edit' do
        if  loggin_in?
            @linetracker = Linetracker.find(params[:id])
            erb :'/linetrackers/edit'
        else
            @linetracker_all_error= "You have to log in to view that page"
            redirect '/login'
        end
            
    end

    patch '/linetrackers/:id' do 
           @linetracker = Linetracker.find(params[:id])    
        if @linetracker.update(params[:linetracker]) #!params["linetracker"]["name"].empty? && !params["linetracker"]["country"].empty? && !params["linetracker"]["currency"].empty?&& !params["linetracker"]["amount"].empty?&& !params["linetracker"]["date"].empty?&& !params["linetracker"]["time"].empty?
            #@linetracker.update(params[:linetracker])
            redirect "/linetrackers/#{@linetracker.id}"
        else
            @error = "Invalid"
            erb :'linetrackers/edit'    
        end
    end
   

    #Delete

    delete '/linetrackers/:id' do 
        @linetracker = Linetracker.find(params[:id])
        @linetracker.destroy
        redirect '/linetrackers'
    end
end