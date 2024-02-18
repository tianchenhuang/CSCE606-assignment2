# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    # 默认排序为 title
    sort = params[:sort] || session[:sort] || 'title'
    dir = params[:dir] || session[:dir] || 'asc'
    
    @movies = Movie.order("#{sort} #{dir}")

    # 保存当前排序状态
    session[:sort] = sort
    session[:dir] = dir
  end
end
