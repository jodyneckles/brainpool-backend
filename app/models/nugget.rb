class Nugget < ApplicationRecord
  serialize :body
  # searchkick
  belongs_to :theme
  has_many :user_nuggets
  has_many :users, through: :user_nuggets
  has_many :nugget_tags
  has_many :tags, through: :nugget_tags

end
