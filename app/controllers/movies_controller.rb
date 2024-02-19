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


# add a new movie

def new
  @movie = Movie.new
end

def create
  @movie = Movie.new(movie_params)
  if @movie.save
    redirect_to movies_path, notice: 'Movie was successfully created.'
  else
    render :new
  end
end

private

def movie_params
  params.require(:movie).permit(:title, :rating, :release_date)
end
