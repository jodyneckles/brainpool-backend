class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :user_workspaces
    has_many :workspaces, through: :user_workspaces
    has_many :user_nuggets
    has_many :nuggets, through: :user_nuggets
    has_many :themes, through: :workspaces

end
