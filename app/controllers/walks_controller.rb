class WalksController < ApplicationController

  get '/walks' do
    if logged_in?
      @walks = my_walks(current_user)
      erb :'/walks/index'
    else
      redirect '/'
    end
  end

  get '/walks/new' do
    if logged_in?
      erb :'/walks/new'
    else
      redirect '/'
    end
  end

  get '/walks/all' do
    if logged_in?
      @walks = my_walks(current_user)
      erb :'/walks/all_walks'
    else
      redirect '/'
    end
  end

  post '/walks' do
    @walk = Walk.new(params[:walk])
    w_start = time_to_datetime(params[:walk][:window_start], @walk.date)
    w_end = time_to_datetime(params[:walk][:window_end], @walk.date)
    @walk.window_start = w_start
    @walk.window_end = w_end
    if @walk.save
      redirect '/walks'
    else
      redirect '/walks/new'
    end
  end

  get '/walks/:id' do
    if logged_in?
      @walk = Walk.find_by(id: params[:id])
      erb :'/walks/show'
    else
      redirect '/'
    end
  end

  get '/walks/:id/edit' do
    if logged_in?
      @walk = Walk.find_by(id: params[:id])
      erb :'/walks/edit'
    else
      redirect '/'
    end
  end

  patch '/walks/:id' do
    @walk = Walk.find_by(id: params[:id])
    if params[:walk][:window_start] and params[:walk][:window_end]
      params[:walk][:window_start] = Time.parse(
        "#{params[:walk][:date]}T#{params[:walk][:window_start]}Z"
      )
      params[:walk][:window_end] = Time.parse(
        "#{params[:walk][:date]}T#{params[:walk][:window_end]}Z"
      )
    end
    if @walk and @walk.update(params[:walk])
      flash[:message] = "Update successful!"
      redirect "/walks/#{@walk.id}"
    else
      flash[:message] = "Update failed"
      redirect "/walks/#{@walk.id}/edit"
    end
  end

  delete '/walks/:id/delete' do
    @walk = Walk.find_by(id: params[:id])
    if @walk.delete
      redirect '/walks'
    else
      redirect "/walks/#{@walk.id}"
    end
  end

  def time_to_datetime(time, datetime)
    day = datetime.strftime('%Y-%m-%d')
    DateTime.parse("#{day}T#{time}")
  end

  def my_walks(user)
    if user.role != 'admin'
      Walk.all.select{ |e| e.user_id == user.id}
    else
      Walk.all
    end
  end

end
