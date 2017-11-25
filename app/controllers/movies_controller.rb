class MoviesController < ApplicationController
#	before_action :josembi_koding_late (:index, :new)

	def index
		
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(josembi_koding_late)
	end

	def update
		
	end

	def destroy
		
	end

	private

	def josembi_koding_late
		params.require(:movie).permit(:title, :description, :director)
	end

end
