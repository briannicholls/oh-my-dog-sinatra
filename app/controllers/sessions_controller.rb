class SessionsController < ApplicationController

  post '/sessions' do
    #binding.pry
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      erb :'/walks/index'
    else
      erb :'/signin'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
