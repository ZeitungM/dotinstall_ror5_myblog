class Comment < ApplicationRecord
  belongs_to :post # post モデルへの紐付け
  validates :body, presence: true  # バリデーション: body の存在を必須に
end
