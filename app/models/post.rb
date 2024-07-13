class Post < ApplicationRecord
  has_many :cafe_tags
  has_many :tags, through: :cafe_tags
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  has_many :pick_ups
  
  has_many_attached :post_images
    
  validates :name, presence: true
  validates :address, presence: true
  validates :hours, presence: true
  validates :days_open, presence: true
  validates :review, presence: true
  validate :at_least_one_image
  validate :maximum_three_images
  #複数写真OKにしてるから最低でも1枚はつけてっていう制限.
  #３枚以上は投稿できない制限
  
  #並び替え
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  # 平均評価順で並び替えるスコープ
  scope :highest_rated, -> {
    left_joins(:comments)
      .group(:id)
      .order(Arel.sql('AVG(comments.star) DESC NULLS LAST'))
  }
  
  
  def at_least_one_image
    errors.add(:post_images, "must have at least one attached image") unless post_images.attached?
  end
  
  def maximum_three_images
    if post_images.count > 3
      errors.add(:post_images, "can't have more than 3 attached images")
    end
  end
  
  #postの平均評価のため
  def average_star
    comments.average(:star).to_f
  end
  #管理者側でコメント件数出すため
  def comments_count
    comments.count
  end
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  #検索　部分一致のみ・対象はカフェ名・住所・営業日・営業時間
  def self.looks(word)
    where("name LIKE ? OR address LIKE ? OR days_open LIKE ? OR hours LIKE ?", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%")
  end
  
end
