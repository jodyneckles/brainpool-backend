class UserNugget < ApplicationRecord
  belongs_to :user
  belongs_to :nugget
end
