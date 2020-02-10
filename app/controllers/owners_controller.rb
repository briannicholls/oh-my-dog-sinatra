class OwnersController < ApplicationController
  get '/owners' do
    erb :'/owners/index'
  end

  get '/owners/new' do
    erb :'/owners/new'
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
    @owner = Owner.find_by(id: params[:id])
    erb :'/owners/show'
  end

  get '/owners/:id/edit' do
    @owner = Owner.find_by(id: params[:id])
    erb :'/owners/edit'
  end

  patch '/owners/:id' do
    @owner = Owner.find_by(id: params[:id])
    if @owner and @owner.update(params[:owner])
      redirect "/owners/#{@owner.id}"
    else
      redirect "/owners/#{@owner.id}/edit"
    end
  end

  delete '/owners/:id' do
    @owner = Owner.find_by(id: params[:id])
    if @owner.delete
      redirect '/owners'
    else
      redirect "/owners/#{@owner.id}"
    end
  end
end
