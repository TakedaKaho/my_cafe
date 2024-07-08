class Like < ApplicationRecord
 belongs_to :post
 belongs_to :user
 #1人一回制限（ユニーク）
 validates :user_id, uniqueness: {scope: :post_id}
 
end
