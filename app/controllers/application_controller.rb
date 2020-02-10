class ApplicationController < Sinatra::Base
  set :views, 'app/views'
  enable :sessions
  set :session_secret, 'potatoes'


  get '/' do
    erb :index
  end

  get '/signin' do
    erb :'signin'
  end

  get '/import' do
    erb :import
  end

  post '/import' do
#    binding.pry
    ContactsImporter.import_from_file(params[:file])
    erb :'/owners/index'
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

  end
end
