class UsersController < ApplicationController

  get '/users' do
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
     @user = User.new(params[:user])
     @user.role = 'employee'
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
    if logged_in? and @user.id == session[:user_id]
      erb :'/users/edit'
    else
      redirect '/users'
    end
  end

  patch '/users/:id' do
    @user = User.find_by(id: params[:id])
    if @user and @user.update(params[:user])
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Update failed."
      redirect "/users/#{@user.id}/edit"
    end
  end

  delete '/users/:id/delete' do
    @user = User.find_by(id: params[:id])
    if @user.delete
      session.clear
      redirect '/'
    else
      redirect "/users/#{@user.id}"
    end
  end

  get '/settings' do
    @user = current_user
    erb :'/users/settings'
  end

  post '/settings' do
    @user = User.find_by(id: params[:id])
    if params[:admin_password] == 'levelup'
      @user.update(params[:user])
      flash[:message] = "User saved successfully." if @user.role == 'admin'
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Update failed."
      erb :'/users/settings'
    end
  end
end
