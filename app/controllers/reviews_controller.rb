class ReviewsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_pin

	def new
		@review = Review.new(pin_id: @pin)
	end

	def create 
		@review = current_user.reviews.build(review_params)
		@review.pin = @pin
		@review.save
		redirect_to @pin
	end

	def update
	end

	def delete
	end

	private

	def set_pin
		@pin =  Pin.find(params[:pin_id])

	end

	def review_params
		params.require(:review).permit(:comment, :pin_id)
	end


end
