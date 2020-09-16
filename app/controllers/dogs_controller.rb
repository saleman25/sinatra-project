class DogsController < ApplicationController

    get '/dogs' do 
        if logged_in? 
            @dogs = Dog.all 
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
        @dogs = current_user.dogs.build(breed: params[:breed], color: params[:color])
        if params[:cute] == "yes"
            @dogs.cute = true
        else 
            @dogs.cute = false
        end 
        if @dogs.save 
            redirect to "/dogs/#{@dogs.id}"
        else 
            redirect to '/dogs/new'
        end 
        end

    get '/dogs/:id' do
        if logged_in?
            @dogs = Dog.find_by_id(params[:id])
            erb :'dogs/show'
        else
            redirect to '/login'
        end
end

    get '/dogs/:id/edit' do 
        if logged_in?
            @dogs = Dog.find_by_id(params[:id])
            if @dogs && @dogs.user == current_user
                erb :'dogs/edit'
            else
                redirect to '/dogs'
        end 
            else 
            redirect to '/login'
        end 
    end 

    patch '/dogs/:id' do
        if logged_in?
            if params[:breed] && params[:color] == ""
            redirect to "/dogs/#{params[:id]}/edit"
          else
            @dog = Dog.find_by_id(params[:id])
            if @dog && @dog.user == current_user
              if @dog.update(breed: params[:breed], color: params[:color])
                redirect to "/dogs/#{@dog.id}"
              else
                redirect to "/dogs/#{@dog.id}/edit"
              end
            else
              redirect to '/dogs'
            end
          end
        else
          redirect to '/login'
        end
      end

    delete '/dogs/:id/delete' do 
    if logged_in?
        @dogs = Dog.find_by_id(params[:id])
        if @dogs.user == current_user
            @dogs.destroy
        
        redirect to '/dogs'
        end
    else
        redirect to '/login'
    end
end
end




