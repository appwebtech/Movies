class MoviesController < ApplicationController
	before_action :feeling_blessed, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category].blank?
		@movies = Movie.all.order("created_at DESC")
	else
		@category_id = Category.find_by(name: params[:category]).id
		@movies = Movie.where(:category_id => @category_id).order("created_at DESC")
		end
	end

	def show
	end

	def new
		@movie = current_user.movies.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		@movie = current_user.movies.build(josembi_koding_late)
		@movie.category_id = params[:category_id]

		if @movie.save
	#		flash[:success] = "Movie Created successfully"
			redirect_to root_path
		else
	#		flash[:primary] = "Something went wrong...."
			render_new
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@movie.category_id = params[:category_id]

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
		params.require(:movie).permit(:title, :description, :director, :category_id, :avatar)
	end

	def feeling_blessed
		@movie = Movie.find(params[:id])
	end

end
