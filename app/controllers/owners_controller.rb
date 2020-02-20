class OwnersController < ApplicationController
  get '/owners' do
    redirect_if_not_logged_in
    erb :'/owners/index'
  end

  get '/owners/new' do
    redirect_if_not_logged_in
    erb :'/owners/new'
  end

  post '/owners' do
    redirect_if_not_logged_in
    @owner = Owner.new(params[:owner])
    if @owner.save
      redirect '/owners'
    else
      redirect '/owners/new'
    end
  end

  get '/owners/:id' do
    redirect_if_not_logged_in
    @owner = Owner.find_by(id: params[:id])
    erb :'/owners/show'
  end

  get '/owners/:id/edit' do
    redirect_if_not_logged_in
    @owner = Owner.find_by(id: params[:id])
    erb :'/owners/edit'
  end

  patch '/owners/:id' do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    @owner = Owner.find_by(id: params[:id])
    if @owner.delete
      redirect '/owners'
    else
      redirect "/owners/#{@owner.id}"
    end
  end
end
