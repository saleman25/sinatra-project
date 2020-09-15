class DogsController < ApplicationController

    get '/dogs' do 
        if logged_in? 
            @dogs = Dogs.all 
            erb :'dogs/dogs'
        else 
            redirect to '/login'
        end
    end 

    get '/dogs/new'
    if logged_in? 
        erb :'dogs/add'
    else
        redirect to '/login'
    end
end 

    post '/dogs' do 
    
        end

    get '/dogs/:id' do
        if logged_in?
            @dogs = Dogs.find_by_id(params[:id])
            erb :'dogs/show'
        else
            redirect to '/login'
        end
end

    get '/dogs/:id/edit' do 
        if logged_in?
            @dogs = Dogs.find_by_id(params[:id])
            if @dogs && @dog.user == current_user
                erb :'dogs/show'
            else
                redirect to 'login'
            end 
        end 

    patch '/dogs/:id' do 
    end 

    delete '/dogs/:id/delete'
    if logged_in?
        @dogs = Dogs.find_by_id(params[:id])
        if @dogs && dogs.user == current_user
            @dogs.delete
        end
        redirect to '/dogs'
    else
        redirect to '/login'
    end
end
end




