class DogsController < ApplicationController

    get '/dogs' do 
        if logged_in? 
            @dogs = Dogs.all 
            erb :'dogs/dogs'
        else 
            redirect to '/login'
        end
    end 

    get '/dogs/new' do
    if logged_in? 
        erb :'dogs/add'
    else
        redirect to '/login'
    end
end 

    post '/dogs' do 
        if logged_in? 
            if params[:]
                redirect to '/dogs/add'
            else 
                @dogs = current_user.dogs.build()
                if @dogs.save 
                    redirect to '/dogs/#{dogs.id}'
                end
            end 
        else 
            redirect to '/login'
        end
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
                erb :'dogs/edit'
            else
                redirect to '/dogs'
        end 
            else 
            redirect to '/login'
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




