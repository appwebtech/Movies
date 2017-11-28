class ReviewsController < ApplicationController
	before_action :kamuthenya_kafoca
	before_action :november_is_gone, only: [:edit, :update, :destroy]

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(kamuthenya)
		@review.movie_id = @movie.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to movie_path(@movie)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(kamuthenya)
			redirect_to movie_path(@movie)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to movie_path(@movie )
	end

	private

	def kamuthenya
		params.require(:review).permit(:rating, :comment)
	end

	def kamuthenya_kafoca
		@movie = Movie.find(params[:movie_id])
	end

	def november_is_gone
		@review = Review.find(params[:id])
	end
end
