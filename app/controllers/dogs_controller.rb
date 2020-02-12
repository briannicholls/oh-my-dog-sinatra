class DogsController < ApplicationController
  get '/dogs' do
    erb :'/dogs/index'
  end

  get '/dogs/new' do
    erb :'/dogs/new'
  end

  post '/dogs' do
    @dog = Dog.new(params[:dog])
    if @dog.save
      redirect '/dogs'
    else
      redirect '/dogs/new'
    end
  end

  get '/dogs/:id' do
    @dog = Dog.find_by(id: params[:id])
    if @dog
      erb :'/dogs/show'
    else
      redirect '/dogs'
    end
  end

  get '/dogs/:id/edit' do
    @dog = Dog.find_by(id: params[:id])
    erb :'/dogs/edit'
  end

  patch '/dogs/:id' do
    @dog = Dog.find_by(id: params[:id])
    if @dog and @dog.update(params[:dog])
      redirect "/dogs/#{@dog.id}"
    else
      redirect "/dogs/#{@dog.id}/edit"
    end
  end

  delete '/dogs/:id' do
    @dog = Dog.find_by(id: params[:id])
    if @dog.delete
      redirect '/dogs'
    else
      redirect "/dogs/#{@dog.id}"
    end
  end
end
