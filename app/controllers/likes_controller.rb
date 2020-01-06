class LikesController < ApplicationController

	def create
		@like = Like.create(user_id: params[:user_id], article_id: params[:article_id])
		redirect_to all_articles_path
	end

	def destroy
    @like = Like.where(user_id: params[:user_id], article_id: params[:article_id])
    @like.destroy_all
	redirect_to all_articles_path
	end
	
end
