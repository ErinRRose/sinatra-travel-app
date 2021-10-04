class UsersController <ApplicationController

    #route for login
    get '/login' do
        erb :login
    end

    post '/login' do
        #find the user
        @user = User.find_by(username: params[:username])
        #auth the user
        if @user && @user.authenticate(params[:password])
         #log the user in  - create user session
         session[:user_id] = @user.id
         #redirect to the user's landing page

         flash[:message] = "Welcome, #{@user.name}!"
         redirect "users/#{@user.id}"
        else
            #invalid, redirect
            flash[:message] = "Your credentials are invalid  Please sign up or try again."
            redirect '/login'
        end
    end

    get '/signup' do
        erb :signup
    end

    post '/users' do
        #if params[:name] != "" && params[:username] != "" && params[:password] != "" 
        @user = User.new(params)
            if @user.save
                session[:user_id] = @user.id
               #flash[:message] = "You have created a new account, #{@user.name}! Welcome!"
                redirect "/users/#{@user.id}"
            else
               # flash[:message] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
                redirect '/signup'
            end
    end

    #route for signup

    get '/users/:id' do
    #"user show route"
        @user = User.find_by(id: params[:id])
        erb :'/users/show' 
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end