Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :posts do # 記事に紐付けて設定
    resources :comments, only: [ :create, :destroy ] # 必要なroutingのみ生成
  end

  root 'posts#index' # rootへのアクセスでposts#index を実行するよう設定
end
