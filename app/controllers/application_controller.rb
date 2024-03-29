class ApplicationController < Sinatra::Base
  set :views, 'app/views'
  enable :sessions

  # set :session_secret, 'potatoes'
  set :session_secret, SecureRandom.hex(32)

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

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/'
      end
    end

    def redirect_if_not_admin
      if !admin?
        flash[:message] = "You must be an administrator to perform that function."
        redirect '/users'
      end
    end

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
