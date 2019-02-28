class UserNuggetSerializer < ActiveModel::Serializer
  belongs_to :users
  belongs_to :nuggets
  attributes :id, :user_id

end

