class WalksController < ApplicationController
  get '/walks' do
    erb :'/walks/index'
  end

  get '/walks/new' do
    erb :'/walks/new'
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
    @walk = Walk.find_by(id: params[:id])
    erb :'/walks/show'
  end

  get '/walks/:id/edit' do
    @walk = Walk.find_by(id: params[:id])
    erb :'/walks/edit'
  end

  patch '/walks/:id' do
    @walk = Walk.find_by(id: params[:id])
    if @walk and @walk.update(params[:walk])
      redirect "/walks/#{@walk.id}"
    else
      redirect "/walks/#{@walk.id}/edit"
    end
  end

  delete '/walks/:id' do
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

end
