class UsersController < ApplicationController
  get '/users' do
    erb :'/users/index'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = User.new(params[:user])
    if @user.save
      redirect '/users'
    else
      redirect '/users/new'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  get '/users/:id/edit' do
    @user = User.find_by(id: params[:id])
    erb :'/users/edit'
  end

  patch '/users/:id' do
    @user = User.find_by(id: params[:id])
    if @user and @user.update(params[:user])
      redirect "/users/#{@user.id}"
    else
      redirect "/users/#{@user.id}/edit"
    end
  end

  delete '/users/:id' do
    @user = User.find_by(id: params[:id])
    if @user.delete
      redirect '/users'
    else
      redirect "/users/#{@user.id}"
    end
  end
end
