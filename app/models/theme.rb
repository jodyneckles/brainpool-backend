class Theme < ApplicationRecord
  belongs_to :workspace
  has_many :nuggets

  validates :name, uniqueness: { case_sensitive: false }
end
