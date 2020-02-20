class UsersController < ApplicationController

  get '/users' do
    redirect_if_not_logged_in
    erb :'/users/index'
  end

  get '/users/new' do
    redirect_if_not_admin
    erb :'/users/new'
  end

  post '/users' do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    if @user and logged_in?
      erb :'/users/show'
    else
      redirect '/'
    end
  end

  get '/users/:id/edit' do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    if logged_in? and @user.id == session[:user_id]
      erb :'/users/edit'
    else
      redirect '/users'
    end
  end

  patch '/users/:id' do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    if @user and @user.update(params[:user])
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Update failed."
      redirect "/users/#{@user.id}/edit"
    end
  end

  delete '/users/:id/delete' do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    if @user.delete
      session.clear
      redirect '/'
    else
      redirect "/users/#{@user.id}"
    end
  end

  get '/settings' do
    redirect_if_not_logged_in
    @user = current_user
    erb :'/users/settings'
  end

  post '/settings' do
    redirect_if_not_logged_in
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

=begin methods for SMS verification
  get '/verify' do
    erb :'/users/verify'
  end

  post '/verify' do
    @verify_id = Tm.send_text("+1#{params[:phone]}")
    flash[:message] = "Text sent to #{params[:phone]}"
    erb :'/users/verify'
  end

  post '/confirm' do
    user = User.find_by(id: params[:id])
    if Tm.confirm params[:pin]
      user.status = 'active'
      flash[:message] = "Account activated!"
      redirect "/users/#{user.id}"
    else
      flash[:message] = "Incorrect PIN"
      erb :'/users/verify'
    end
  end
=end
end
