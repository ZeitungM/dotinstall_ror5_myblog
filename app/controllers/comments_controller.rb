class CommentsController < ApplicationController

    def create
       @post = Post.find(params[:post_id]) # 個別の記事を取得
       # バリデーションをする場合は new save を使う 
       @post.comments.create( comment_params ) # strong parameter を使用
       redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id]) # 個別の記事を取得
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post) # 個別の記事のページにリダイレクト
    end

    private # strong-parameter を設定
        def comment_params
            params.require(:comment).permit(:body)
        end

end
