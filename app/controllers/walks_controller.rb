class WalksController < ApplicationController

  get '/walks' do
    redirect_if_not_logged_in
    if admin?
      @walks = Walk.all
    else
      @walks = my_walks(current_user)
    end
    erb :'/walks/index'
  end

  get '/walks/new' do
    redirect_if_not_logged_in
    erb :'/walks/new'
  end

  get '/walks/all' do
    redirect_if_not_logged_in
    if admin?
      @walks = Walk.all
    else
      @walks = my_walks(current_user)
    end
    erb :'/walks/all_walks'
  end

  post '/walks' do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    @walk = Walk.find_by(id: params[:id])
    erb :'/walks/show'
  end

  get '/walks/:id/edit' do
    redirect_if_not_logged_in
    @walk = Walk.find_by(id: params[:id])
    erb :'/walks/edit'
  end

  patch '/walks/:id' do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
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
