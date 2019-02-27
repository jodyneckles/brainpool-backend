class Theme < ApplicationRecord
  belongs_to :workspace
  has_many :nuggets
end
