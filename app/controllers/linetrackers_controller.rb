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

    get '/linetrackers/:id' do 
        #binding.pry
        @linetracker = Linetracker.find(params[:id])
        erb :'/linetrackers/show'
    end

    get '/linetrackers' do

        @linetrackers = Linetracker.all.reverse

        erb :'linetrackers/index'
    end

    #update

    get '/linetrackers/:id/edit' do
        @linetracker = Linetracker.find(params[:id])
        erb :'linetrackers/edit'

    end

end