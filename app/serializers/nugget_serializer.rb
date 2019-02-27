class NuggetSerializer < ActiveModel::Serializer
  attributes :id, :title, :img_url, :video_url, :question, :body
  belongs_to :theme
  has_many :nugget_tags
  has_many :user_nuggets
  class NuggetTagSerializer < ActiveModel::Serializer
    attributes :id, :nugget_id, :tag_id
  end
  class UserNuggetSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :nugget_id
  end
end
