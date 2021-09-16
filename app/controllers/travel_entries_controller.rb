class TravelEntriesController < ApplicationController

    # get new to render a form to create a new entry
    get '/travel_entries/new' do
      erb :'/travel_entries/new'  
    end
    # post travel_entries to create a new entry
    post '/travel_entries' do
        
    end
    # show route for a travel entry

    # index route for all travel entries

end
