class TagSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :nugget_tags
  class UserNuggetSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :tag_id
  end
end
