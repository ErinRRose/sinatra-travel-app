class UsersController <ApplicationController

    #route for login
    get '/login' do
        erb :login
    end

    post '/login' do
        #find the user
        @user = User.find_by(username: params[:username])
        #auth the user
        if @user.authenticate(params[:password])
         #log the user in  - create user session
         session[:user_id] = @user.id
         #redirect to the user's landing page
         redirect "users/#{@user.id}"
        else
            #invalid, redirect
        end
        
        

        
    end

    

    get '/signup' do
    
    end


    #route for signup

    get '/users/:id'
    "user show route"
    end
end
