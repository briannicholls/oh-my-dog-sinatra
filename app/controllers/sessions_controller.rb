class SessionsController < ApplicationController

  post '/sessions' do
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      erb :'/walks/index'
    else
      flash[:message] = "Incorrect email or password."
    end
    erb :'/signin'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
