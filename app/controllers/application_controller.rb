class ApplicationController < Sinatra::Base
  set :views, 'app/views'
  enable :sessions
  set :session_secret, 'potatoes'
  set :public_folder, 'public'
  use Rack::Flash, :sweep => true


  get '/' do
    if logged_in?
      redirect '/walks'
    else
      erb :index
    end
  end

  get '/signin' do
    if !logged_in?
      erb :'signin'
    else
      redirect '/'
    end
  end

  get '/import' do
    if logged_in?
      erb :import
    else
      redirect '/signin'
    end
  end

  post '/import' do
    @file = File.open params[:file][:tempfile]
    ContactsImporter.import_from_file(@file) if @file
    erb :'/owners/index'
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def admin?
      current_user.role == 'admin'
    end

  end
end
