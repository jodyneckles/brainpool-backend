class Theme < ApplicationRecord
  belongs_to :workspace
  has_many :nuggets

  validates :title, uniqueness: { case_sensitive: false }
end
