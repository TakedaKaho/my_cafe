class Tag < ApplicationRecord
    has_many :cafe_tags
    
    validates :name, presence: true
end