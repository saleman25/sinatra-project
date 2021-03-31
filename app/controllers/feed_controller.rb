# this is probably going to be where i
# make the functions so that it can b more dynamic 
# so that others can use it like twitter is
class FeedController < ApplicationController

  get '/feed' do
    if logged_in? 
        @dogs = @dogs.all 
        erb :'dashboard'
    else 
        redirect to '/login'
    end
end 