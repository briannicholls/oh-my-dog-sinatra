class OwnersController < ApplicationController
  get '/owners' do
    if logged_in?
      erb :'/owners/index'
    else
      redirect '/'
    end
  end

  get '/owners/new' do
    if logged_in?
      erb :'/owners/new'
    else
      redirect '/'
    end
  end

  post '/owners' do
    @owner = Owner.new(params[:owner])
    if @owner.save
      redirect '/owners'
    else
      redirect '/owners/new'
    end
  end

  get '/owners/:id' do
    if logged_in?
      @owner = Owner.find_by(id: params[:id])
      erb :'/owners/show'
    else
      redirect '/'
    end
  end

  get '/owners/:id/edit' do
    if logged_in?
      @owner = Owner.find_by(id: params[:id])
      erb :'/owners/edit'
    else
      redirect '/'
    end
  end

  patch '/owners/:id' do
    @owner = Owner.find_by(id: params[:id])
    if @owner and @owner.update(params[:owner])
      flash[:message] = "Update successful."
      redirect "/owners/#{@owner.id}"
    else
      flash[:message] = "Update failed."
      redirect "/owners/#{@owner.id}/edit"
    end
  end

  delete '/owners/:id/delete' do
    @owner = Owner.find_by(id: params[:id])
    if @owner.delete
      redirect '/owners'
    else
      redirect "/owners/#{@owner.id}"
    end
  end
end
