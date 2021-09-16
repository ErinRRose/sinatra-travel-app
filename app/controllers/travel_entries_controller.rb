class TravelEntriesController < ApplicationController

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
        @travel_entry = TravelEntry.create(content: params[:content], user_id: current_user.id)
        redirect "/travel_entries/#{travel_entry.id}"
      else
        redirect '/travel_entries/new'
      end
        
    end
    # show route for a travel entry
    get '/travel_entries/:id' do
      @travel_entry = TravelEntry.find(params[:id])
      erb :'travel_entries/show'
    end

    # index route for all travel entries

end
