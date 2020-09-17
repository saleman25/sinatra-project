class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'users/signup'  
        else 
            redirect to '/dogs'
        end 
    end 
    
    post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
        @error = "*Data invalid. Please fill out the form accordingly.*"
        erb :'users/signup'
    else 
        @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
        @user.save 
        session[:user_id] = @user.id 
        redirect to '/dogs'
    end 
end 

    get '/login' do 
        if !logged_in? 
            erb :'users/login'
        else 
            redirect to '/dogs'
        end 
    end

    post '/login' do 
        user = User.find_by(:username => params[:username])
        
        if user && user.authenticate(params[:password])
         
            session[:user_id] = user.id
           
            redirect to '/dogs'
        else
            redirect to '/signup'
        end
    end

    get '/logout' do
        if logged_in? 
            session.destroy
            redirect to 'login'
        else
            redirect to '/'
        end
end 
end