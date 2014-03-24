class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@beer = Beer.find(params[:beer_id])
		@comment = Comment.create(comment_params)
		@beer.comments << @comment
		current_user.comments << @comment

		redirect_to @beer, notice: "comment created"
	end

	private
	def comment_params
		params.require(:comment).permit(:id, :beer_id, :user_id, :text)
	end
end
