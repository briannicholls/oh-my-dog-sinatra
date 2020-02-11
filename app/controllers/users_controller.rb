class UsersController < ApplicationController
  #before '/users/*' do
  #  # authenticate!
  #end

  get '/users' do
    #pass if !logged_in?
    if !logged_in?
      redirect '/'
    else
      erb :'/users/index'
    end
  end

  get '/users/new' do
    if logged_in?
      redirect '/'
    else
      erb :'/users/new'
    end
  end

  post '/users' do
    #binding.pry
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect '/walks'
    else
      erb :'/users/new'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    if @user and logged_in?
      erb :'/users/show'
    else
      redirect '/'
    end
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
      session.clear
      redirect '/'
    else
      redirect "/users/#{@user.id}"
    end
  end
end
