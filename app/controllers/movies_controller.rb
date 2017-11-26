class MoviesController < ApplicationController
#	before_action :josembi_koding_late (:index, :new)
	before_action :feeling_blessed, only: [:show, :edit, :update, :destroy]

	def index
		@movies = Movie.all.order("created_at DESC")
	end

	def show
	end

	def new
		@movie = current_user.play.build
	end

	def create
		@movie = current_user.play.build(josembi_koding_late)
		if @movie.save
			flash[:success] = "Movie Created successfully"
			redirect_to root_path
		else
			flash[:primary] = "Something went wrong...."
			render_new
		end
	end

	def edit

	end

	def update
		if @movie.update(josembi_koding_late)
			redirect_to movie_path(@movie)
		else
			render 'edit'
		end
	end

	def destroy
		@movie.destroy 
		redirect_to root_path
	end

	private

	def josembi_koding_late
		params.require(:movie).permit(:title, :description, :director)
	end

	def feeling_blessed
		@movie = Movie.find(params[:id])
	end

end
