class PostsController < ApplicationController
    def index
        @posts = Post.all.order(created_at: 'desc') # 前記事を新しいものから並べる
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new # エラー時にnewアクションを呼び出した時のために空オブジェクトを作っておく
    end

    def create
        # render plain: params[:post].inspect
        # save
        @post = Post.new( post_params ) # 新たなPostレコードを作成
        if @post.save # セーブに成功したら記事一覧にリダイレクト
            redirect_to posts_path
        else          # 失敗したら
            # render plain: @post.errors.inspect # エラー内容を表示
            render 'new' # ビューnew を表示
        end           # if にはend を忘れない
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params) # バリデーションしてアップデートに成功したら 
            redirect_to posts_path  # 記事一覧にリダイレクト
        else
            render 'edit' # エラーメッセージ付きでeditのview が表示されるはず
        end
    end

    def destroy
        @post = Post.find(params[:id]) # 記事の特定
        @post.destroy
        redirect_to posts_path  # 記事一覧にリダイレクト
    end

end

# private method
private
    def post_params
        params.require(:post).permit(:title, :body) # titleとbodyがあるハッシュであることを確認
    end
