class TravelEntriesController < ApplicationController

    get '/travel_entries' do
      @travel_entries = TravelEntry.all
      erb :'travel_entries/index'
    end

    # get new to render a form to create a new entry
    get '/travel_entries/new' do
      erb :'/travel_entries/new'  
    end
    # post travel_entries to create a new entry
    post '/travel_entries' do
      if !logged_in?
        redirect '/'
      end

      if params[:content] != ""
        @travel_entry = TravelEntry.create(content: params[:content], user_id: current_user.id, name_location: params[:name_location])
        redirect "/travel_entries/#{@travel_entry.id}"
      else
        redirect '/travel_entries/new'
      end
        
    end
    # show route for a travel entry
    get '/travel_entries/:id' do
      set_travel_entry
      erb :'/travel_entries/show'
    end

    get '/travel_entries/:id/edit' do
      set_travel_entry
      if logged_in?
        if authorized?(@travel_entry)
          erb :'/travel_entries/edit'
        else
          redirect "users/#{current_user.id}"
        end
      else
        redirect '/'
      end
    end

    patch '/travel_entries/:id' do
      set_travel_entry
      if logged_in?
        if authorized?(@travel_entry) 
          @travel_entry.update(content: params[:content], name_location: params[:name_location])
          redirect "/travel_entries/#{@travel_entry.id}"
        else
          redirect "users/#{current_user.id}"
        end
      else
        redirect '/'
      end
    end
    
    delete '/travel_entries/:id' do
      set_travel_entry
      if authorized?(@travel_entry)
        @travel_entry.destroy
        redirect '/travel_entries'
      else
        redirect '/travel_entries'
      end
    end
    private

    def set_travel_entry
      @travel_entry = TravelEntry.find(params[:id])
    end


end
