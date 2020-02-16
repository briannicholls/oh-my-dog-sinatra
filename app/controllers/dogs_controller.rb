class DogsController < ApplicationController
  get '/dogs' do
    if logged_in?
      erb :'/dogs/index'
    else
      redirect '/'
    end
  end

  get '/dogs/new' do
    if logged_in?
      erb :'/dogs/new'
    else
      redirect '/'
    end
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
    if logged_in?
      @dog = Dog.find_by(id: params[:id])
      if @dog
        erb :'/dogs/show'
      else
        redirect '/dogs'
      end
    else
      redirect '/'
    end
  end

  get '/dogs/:id/edit' do
    if logged_in?
      @dog = Dog.find_by(id: params[:id])
      erb :'/dogs/edit'
    else
      redirect '/'
    end
  end

  patch '/dogs/:id' do
    @dog = Dog.find_by(id: params[:id])
    if !!params[:photo][:tempfile]
      @dog.image = photo_upload(params[:photo][:tempfile].path, @dog.name)
    end
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

  def photo_upload(image_file, title)
    client = Imgur.new(ENV['CLIENT_ID'])
    image = Imgur::LocalImage.new(image_file, title: title)
    uploaded = client.upload image
    uploaded.link
  end

end
