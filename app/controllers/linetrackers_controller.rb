class LinetrackerController < ApplicationController

    
    
    #Create

    get '/linetrackers/new' do
        erb :'/linetrackers/new'
    end

    post '/linetrackers' do
        linetracker = Linetracker.new(params)
        if linetracker.save
            redirect '/linetrackers'
        else
            @error = "Data invalid. Please try again."
            erb  :'/linetrackers/new'
        end  
    end
    
    
    #Read

    get '/linetrackers' do
       
        @linetrackers = Linetracker.all.reverse
        erb :'linetrackers/index'
    end

    get '/linetrackers/:id' do
        @linetracker = Linetracker.find(params[:id])
        erb :'/linetrackers/show'

    end


    #update

    get '/linetrackers/:id/edit' do
        
        @linetracker = Linetracker.find(params[:id])
        erb :'/linetrackers/edit'
    end

    patch '/linetrackers/:id' do 
           @linetracker = Linetracker.find(params[:id])    
        if !params["linetracker"]["name"].empty? && !params["linetracker"]["country"].empty? && !params["linetracker"]["currency"].empty?&& !params["linetracker"]["amount"].empty?&& !params["linetracker"]["date"].empty?&& !params["linetracker"]["time"].empty?
            @linetracker.update(params[:linetracker])
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