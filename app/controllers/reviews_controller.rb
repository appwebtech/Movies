class ReviewsController < ApplicationController
	before_action :kamuthenya_kafoca

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(kamuthenya)
		@review.movie_id = @movie_id
		@review.user_id = current_user.id

		if @review.save
			redirect_to movie_path(@movie)
		else
			render 'new'
		end
	end

	private

	def kamuthenya
		params.require(:review).permit(:rating, :comment)
	end

	def kamuthenya_kafoca
		@movie = Movie.find(params[:movie_id])
	end
end
