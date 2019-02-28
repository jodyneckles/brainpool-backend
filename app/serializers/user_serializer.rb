class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstname, :lastname, :email, :avatar, :workspaces
  has_many :user_nuggets
  class UserNuggetSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :nugget_id
  end
end
