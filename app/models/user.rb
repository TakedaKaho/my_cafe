class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  #validates :email, presence: true
  #validates :password, presence: true
         
  has_one_attached :profile_images
  
  
  #退会済みuserがログインできないように
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
