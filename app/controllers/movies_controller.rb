# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    # 默认按标题排序
    @sort = params[:sort] || session[:sort] || 'title'
    @dir = params[:dir] || session[:dir] || 'asc'
    
    # 如果参数中包含排序并且与会话中的不同，更新会话
    session[:sort] = @sort if params[:sort]
    session[:dir] = @dir if params[:dir]
    
    # 根据会话中的排序参数排序电影
    @movies = Movie.order("#{session[:sort]} #{session[:dir]}")
  end

  def show
    # @movie 由 set_movie 方法设置
  end

  def new
    @movie = Movie.new
  end

  def edit
    # @movie 由 set_movie 方法设置
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end

  private

    # 使用回调来共享设置电影的代码
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # 只允许白名单参数
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
end
