class CafeTag < ApplicationRecord
    belongs_to :user
    belongs_to :tag
end
