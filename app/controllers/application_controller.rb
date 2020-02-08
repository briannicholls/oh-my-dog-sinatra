class ApplicationController < Sinatra::Base
  set :views, 'app/views'
  enable :sessions
  set :session_secret, 'potatoes'


  get '/' do
    erb :index
  end
end
