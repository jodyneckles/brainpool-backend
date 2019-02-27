class Tag < ApplicationRecord
    has_many :nugget_tags
    has_many :nuggets, through: :nugget_tags
end
