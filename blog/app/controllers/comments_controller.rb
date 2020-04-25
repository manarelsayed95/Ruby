class CommentsController < ApplicationController

    #authentication handling
    http_basic_authenticate_with name: "admin", password: "admin", only: :destroy

    #create method to add new comment
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    #destroy method to delete comment
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end

end
