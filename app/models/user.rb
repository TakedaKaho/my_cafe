class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :name, presence: true
         
  has_one_attached :profile_image
  
  
  #退会済みuserがログインできないように
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
