class MoviesController < ApplicationController
  # before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    search = Movie.all
    if params.has_key?(:title)
    q = "%#{params[:title]}%"
    search = search.where("title like ?", q)
    end
    if params.has_key?(:director)
    q = "%#{params[:director]}%"
    search = search.where("director like ?", q)
    end
    if params.has_key?(:duration)
      time = params[:duration]
      if time == "1"
            search = search.where("runtime_in_minutes < 90")
      elsif time == "2"
            search = search.where("runtime_in_minutes BETWEEN 90 AND 120")
      elsif time == "3"
            search = search.where("runtime_in_minutes > 120")
      end
    end
    @movies = search
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def search
    puts "searched"
    @movie
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :image, :description
    )
  end
end
