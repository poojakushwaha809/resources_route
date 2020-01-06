class AnswersController < ApplicationController

	def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:comment_id])
    @reply = @comment.replies.find(params[:reply_id])
    @answer = @reply.answers.create(answer_params)

    redirect_to article_path(@article)
  end


  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:comment_id])
    @reply = @comment.replies.find(params[:reply_id])
    @answer = @reply.answers.find(params[:id])

    @answer.destroy
    redirect_to article_path(@article)
  end
 

  private
    def answer_params
      params.require(:answer).permit(:answer)
    end

end
