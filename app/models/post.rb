class Post < ApplicationRecord
    # 記事:コメント=1:N なので、has_many: comment's'とする
    has_many :comments, dependent: :destroy # postが削除された時に関連するモデルからもデータを削除
    validates :title, presence: true, length: { minimum: 3, message: 'Too short to post!' } # 入力必須、3文字以上
    validates :body,  presence: true
end
