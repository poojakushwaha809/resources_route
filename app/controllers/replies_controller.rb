class RepliesController < ApplicationController
	def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:comment_id])
    @reply = @comment.replies.create(reply_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:comment_id])
    @reply = @comment.replies.find(params[:id])

    @reply.destroy
    redirect_to article_path(@article)
  end
 
 
  private
    def reply_params
      params.require(:reply).permit(:reply)
    end
end
