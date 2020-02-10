class SessionsController < ApplicationController

  post '/sessions' do
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id
    erb :'/walks/index'
  end
  
end
