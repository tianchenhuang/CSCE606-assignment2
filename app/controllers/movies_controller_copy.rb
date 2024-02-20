# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    # defualt listed by title
    sort = params[:sort] || session[:sort] || 'title'
    dir = params[:dir] || session[:dir] || 'asc'
    
    @movies = Movie.order("#{sort} #{dir}")

    # keep current sorting
    session[:sort] = sort
    session[:dir] = dir
  end
end


